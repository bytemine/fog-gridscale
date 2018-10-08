module Fog
  module Compute
    class Gridscale
      class Real

        def cas_create(name, action_payload,filters, event_type, action_type)

          create_options = {
              :name   => name,
              :location_uuid => "45ed677b-3702-4b36-be2a-a2eab9827950",
              :action_payload   => action_payload,
              :filters   => filters,
              :event_type => event_type,
              :action_type => action_type,
          }

          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/cas/tasks",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
