require "./lib"

module CRMRB
  class Application

    class Exception < ::Exception; end
    class FileError < Exception; end

    def run
      run_scripts
    rescue error : Exception
      puts "ERROR: #{error}"

      exit(1)
    end

    protected def run_scripts
      paths = ARGV

      paths.each do |path|
        raise FileError.new("File does not exist: #{path}") unless File.exists?(path)
        source = File.read(path)

        Lib.crmrb_execute(source)
      end
    end

  end
end
