# $ svgo --help
# Nodejs-based tool for optimizing SVG vector graphics files
#
# Usage:
#   svgo [OPTIONS] [ARGS]
#
# Options:
#   -h, --help : Help
#   -v, --version : Version
#   -i INPUT, --input=INPUT : Input file, "-" for STDIN
#   -s STRING, --string=STRING : Input SVG data string
#   -f FOLDER, --folder=FOLDER : Input folder, optimize and rewrite all *.svg files
#   -o OUTPUT, --output=OUTPUT : Output file or folder (by default the same as the input), "-" for STDOUT
#   -p PRECISION, --precision=PRECISION : Set number of digits in the fractional part, overrides plugins params
#   --config=CONFIG : Config file to extend or replace default
#   --disable=DISABLE : Disable plugin by name
#   --enable=ENABLE : Enable plugin by name
#   --datauri=DATAURI : Output as Data URI string (base64, URI encoded or unencoded)
#   --multipass : Enable multipass
#   --pretty : Make SVG pretty printed
#   -q, --quiet : Only output error messages, not regular status messages
#   --show-plugins : Show available plugins and exit
#
# Arguments:
#   INPUT : Alias to --input
#   OUTPUT : Alias to --output

class Sprockets::SVGO::Command
  DEFAULTS = {
    multipass: true,
    enable: "removeViewBox"
  }

  attr_reader :options

  def initialize(options = {})
    @options = options.reverse_merge(DEFAULTS)
  end

  def execute
    command = [svgo_path]

    if options[:filename]
      command << "--input=#{options[:filename]}"
    end

    if options[:output]
      command << "--output #{options[:output]}"
    end

    if options[:datauri]
      command << "--datauri=#{options[:datauri]}"
    end

    if options[:disable]
      options[:disable].to_s.split(" ").each do |plugin|
        command << "--disable=#{plugin}"
      end
    end

    if options[:enable]
      options[:enable].to_s.split(" ").each do |plugin|
        command << "--enable=#{plugin}"
      end
    end

    if options[:multipass]
      command << "--multipass"
    end

    if options[:precision]
      command << "--precision=#{options[:precision]}"
    end

    if options[:version]
      command << "--version"
    end

    `#{command.join(" ")}`.chomp
  end

  private
    LOCAL_SVGO_PATH = "node_modules/.bin/svgo"

    def svgo_path
      @svgo_path ||= local_svgo_path || global_svgo_path || svgo_not_installed
    end

    def local_svgo_path
      LOCAL_SVGO_PATH if File.exists?(LOCAL_SVGO_PATH)
    end

    def global_svgo_path
      `which svgo`.chomp.presence
    end

    def svgo_not_installed
      raise "svgo not installed, run `npm install svgo`"
    end
end
