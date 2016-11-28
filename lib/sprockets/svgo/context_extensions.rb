module Sprockets
  class Context
    def svgo_asset_data_uri(path, options = {})
      asset = depend_on_asset(path)
      options = options.merge(filename: asset.filename)

      environment.cache.fetch([:svgo, options.to_s]) do
        SVGO.uri(options)
      end
    end
  end
end
