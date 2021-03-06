require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class ServerRelationStorage < Fog::Model
        identity :object_uuid

        attribute :bootdevice
        attribute :bus
        attribute :capacity
        attribute :controller
        attribute :create_time
        attribute :last_used_template
        attribute :license_product_no
        attribute :lun
        attribute :object_name
        attribute :object_uuid
        attribute :server_uuid
        attribute :storage_type
        attribute :target
        attribute :storage_uuid
        attribute :payload

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :server_uuid, :storage_uuid

          options = {}
          if attributes[:bootdevice]
            options[:bootdevice] = bootdevice
          end

          service.server_relation_storage_create(server_uuid, storage_uuid, options)

        end

        def delete
          object_uuid = {}
          object_uuid[:server_uuid] = attributes[:server_uuid]
          object_uuid[:storage_uuid] = attributes[:storage_uuid]
          service.server_relation_storage_delete(server_uuid, storage_uuid)
        end

        def destroy
          response = service.server_relation_storage_delete(object_uuid)
          response.body
        end

      end
    end
  end
end
