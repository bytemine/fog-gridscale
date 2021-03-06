module Fog
  module Compute
    class Gridscale
      class Real

        def server_delete(server_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/servers/#{server_uuid}",
              )
        end

      end
    end
  end
end
