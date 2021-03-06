module Fog
  module Compute
    class Gridscale
      class Real

        def storage_delete(storage_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/storages/#{storage_uuid}",
              )
        end

      end
    end
  end
end
