require "sprockets"
require "sprockets/svgo/version"
require "sprockets/svgo/command"
require "sprockets/svgo/context_extensions"
require "sprockets/svgo/sass_functions"

module Sprockets::SVGO
  class << self
    def uri(options = {})
      options = options.merge(datauri: "enc", output: "-")
      Command.new(options).execute
    end

    def cache_key
      @cache_key ||= "#{name}:#{VERSION}:svgo:#{version}"
    end

    def version
      @version ||= Command.new(version: true).execute
    end
  end
end
