module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_ipaddr_get(server_uuid, ip_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/ips/#{ip_uuid}"
          )
        end
      end
    end
  end
end