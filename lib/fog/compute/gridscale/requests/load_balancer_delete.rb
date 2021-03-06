module Fog
  module Compute
    class Gridscale
      class Real

        def load_balancer_delete(load_balancer_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/loadbalancers/#{load_balancer_uuid}",
              )
        end

      end
    end
  end
end
