module Fog
  module Compute
    class Gridscale
      class Real

        def storage_events_get(storage_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages/#{storage_uuid}/events"
          )
        end

      end
    end
  end
end
