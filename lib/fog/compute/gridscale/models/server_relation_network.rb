require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class ServerRelationNetwork < Fog::Model
        identity :object_uuid

        attribute :bootdevice
        attribute :create_time
        attribute :firewall
        attribute :firewall_template_uuid
        attribute :l2security
        attribute :l3security
        attribute :mac
        attribute :mcast
        attribute :network_type
        attribute :network_uuid
        attribute :object_name
        attribute :object_uuid
        attribute :ordering
        attribute :partner_uuid
        attribute :public_net
        attribute :server_uuid
        attribute :vlan
        attribute :vxlan


        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :server_uuid, :network_uuid

          options = {}
          if attributes[:bootdevice]
            options[:bootdevice] = bootdevice
          end

          service.server_relation_network_create(server_uuid, network_uuid, options)

        end

        def delete
          object_uuid = {}
          object_uuid[:server_uuid] = attributes[:server_uuid]
          object_uuid[:network_uuid] = attributes[:network_uuid]
          service.server_relation_network_delete(server_uuid, network_uuid)
        end

        def destroy

          response = service.server_relation_network_delete(object_uuid)
          response.body
        end

      end
    end
  end
end
