module Fog
  module Compute
    class Gridscale
      class Real

        def cas_delete(cas_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "objects/cas/tasks/#{cas_uuid}",
              )
        end

      end
    end
  end
end
