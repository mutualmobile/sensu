module Sensu
  class CLI
    def self.read(arguments=ARGV)
      options = Hash.new
      optparse = OptionParser.new do |opts|
        opts.on('-h', '--help', 'Display this message') do
          puts opts
          exit
        end
        opts.on('-V', '--version', 'Display version') do
          puts VERSION
          exit
        end
        opts.on('-c', '--config FILE', 'Sensu JSON config FILE. Default is /etc/sensu/config.json') do |file|
          options[:config_file] = file
        end
        opts.on('-d', '--config_dir DIR', 'DIR for supplemental Sensu JSON config files. Default is /etc/sensu/conf.d/') do |dir|
          options[:config_dir] = dir
        end
        opts.on('-l', '--log FILE', 'Log to a given FILE. Default is to log to stdout') do |file|
          options[:log_file] = file
        end
        opts.on('-v', '--verbose', 'Enable verbose logging') do
          options[:verbose] = true
        end
        opts.on('-b', '--background', 'Fork into the background') do
          options[:daemonize] = true
        end
        opts.on('-p', '--pid_file FILE', 'Write the PID to a given FILE') do |file|
          options[:pid_file] = file
        end
      end
      optparse.parse!(arguments)
      DEFAULT_OPTIONS.merge(options)
    end
  end
end
