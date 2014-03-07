module Rescpos
  class Printer
    attr_reader :dev_file

    def initialize(path, open_mode = 'wb')
      @dev_file = File.open(path, open_mode)
      @dev_file.write("\x1b\x40")
      @dev_file.flush
    end

    def self.open(path, open_mode = 'wb')
      printer = new(path, open_mode)
    end

    def close
      @dev_file.close
    end

    def print(content, opts = { :encoding => 'GBK', :cut_mode => :partial_cut })
      content = Iconv.iconv("#{ opts[:encoding] || 'GBK' }//IGNORE","UTF-8//IGNORE", content)[0]
      @dev_file.write(content)
      @dev_file.flush
      send(opts[:cut_mode] || :partial_cut)
    end

    def print_report(report, opts={})
      print(report.render, opts)
    end

    private
    def send_command(command)
      @dev_file.write(command)
      @dev_file.flush
    end
    
    def partial_cut
      #send_command("\n\n\n\n\x1d\x561\x0c")
      send_command("\n\n\n\n\x1D\x56\x41\x01")
    end

    def full_cut
      #send_command("\n\n\n\n\x1b\x69\x0c")
      send_command("\n\n\n\n\x1D\x56\x41\x01")
    end
  end
end
