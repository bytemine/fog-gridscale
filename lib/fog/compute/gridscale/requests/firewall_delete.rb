module Fog
  module Compute
    class Gridscale
      class Real

        def firewall_delete(firewall_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/firewalls/#{firewall_uuid}",
              )
        end

      end
    end
  end
end
