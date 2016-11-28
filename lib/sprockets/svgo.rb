require "sprockets"
require "sprockets/svgo/version"
require "sprockets/svgo/command"
require "sprockets/svgo/context_extensions"
require "sprockets/svgo/sass_functions"

module Sprockets::SVGO
  def self.uri(options = {})
    options = options.merge(datauri: "enc", output: "-")
    Command.new(options).execute
  end
end
