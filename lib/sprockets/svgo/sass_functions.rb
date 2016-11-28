module Sprockets
  module SassProcessor::Functions
    def svgo_data_uri(path, options = {})
      url = sprockets_context.svgo_asset_data_uri(path.value, options.symbolize_keys)
      Autoload::Sass::Script::String.new("url(" + url + ")")
    end

    Autoload::Sass::Script::Functions.declare :svgo_data_uri, [:path], var_kwargs: true
  end
end
