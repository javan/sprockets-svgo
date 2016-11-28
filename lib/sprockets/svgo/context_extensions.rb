module Sprockets
  class Context
    def svgo_asset_data_uri(path, options = {})
      asset = depend_on_asset(path)
      cache_key = [SVGO.cache_key, asset.hexdigest, options]
      environment.cache.fetch(cache_key) do
        SVGO.uri(options.merge(filename: asset.filename))
      end
    end
  end
end
