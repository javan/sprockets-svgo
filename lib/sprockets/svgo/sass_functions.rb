module Sprockets
  module SassProcessor::Functions
    def svgo_data_uri(path, options = {})
      options = options.transform_values(&:value).symbolize_keys
      url = sprockets_context.svgo_asset_data_uri(path.value, options)
      Autoload::Sass::Script::String.new("url(" + url + ")")
    end

    Autoload::Sass::Script::Functions.declare :svgo_data_uri, [:path], var_kwargs: true
  end
end
