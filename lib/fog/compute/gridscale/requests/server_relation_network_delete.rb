module Fog
  module Compute
    class Gridscale
      class Real

        def server_relation_network_delete(object_uuid)

          server_uuid = object_uuid[:server_uuid]
          network_uuid = object_uuid[:network_uuid]

          request(
              :expects         => [202],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/servers/#{server_uuid}/networks/#{network_uuid}",
              )
        end

      end
    end
  end
end
