require 'fog/compute/gridscale/models/loadbalancer'

module Fog
  module Compute
    class Gridscale
      class Loadbalancer < Fog::Model
        identity :object_uuid

        attribute :algorithm
        attribute :backend_servers
        attribute :change_time
        attribute :create_time
        attribute :current_price
        attribute :forwarding_rules
        attribute :labels
        attribute :listen_ipv4_uuid
        attribute :listen_ipv6_uuid
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_site
        attribute :location_uuid
        attribute :name
        attribute :object_uuid
        attribute :redirect_http_to_https
        attribute :status
        attribute :usage_in_minutes

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :algorithm, :listen_ipv4_uuid, :listen_ipv6_uuid, :backend_servers, :forwarding_rules, :redirect_http_to_https, :labels

          options = {}

          if attributes[:storage_type]
            options[:storage_type] = storage_type
          end

          if attributes[:location_uuid]
            options[:location_uuid] = location_uuid
          end

          data = service.load_balancer_create(name, algorithm, listen_ipv4_uuid, listen_ipv6_uuid, backend_servers, forwarding_rules, redirect_http_to_https, labels, options)

          merge_attributes(data.body)
          true
        end

        def delete
          requires :object_uuid
          response = service.load_balancer_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.load_balancer_delete(object_uuid)
          response.body
        end

      end
    end
  end
end
