module Fog
  module Compute
    class Gridscale
      class Real

        def server_update(server_uuid, payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/servers/#{server_uuid}",
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
