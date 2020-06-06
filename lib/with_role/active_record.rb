require 'active_support/concern'

module WithRole
  module ActiveRecord
    extend ActiveSupport::Concern

    included do
    end

    class_methods do
      # Abling models to have the role feature
      # === Usage
      #
      # class User < ActiveRecord::Base
      #   with_role
      # end
      #
      def with_role(**options)
        class_eval do
          # Set role of a resource.
          # Make sure role is listed in config/initializers/with_role.rb
          # === Example
          #
          # user.set_role(:admin)
          #
          def set_role(new_role)
            available_roles = ::WithRole.configuration[:available_roles].map(&:downcase)
            new_role = new_role.to_s.downcase

            if available_roles.exclude?(new_role)
              raise "Not a valid role!. Available roles are #{available_roles.join(",")}"
            end

            self.role = new_role
            save
          end

          def remove_role!
            self.role = nil
            save
          end

          # Define role checkers
          # === Examples
          #
          # user.admin_role?
          #
          ::WithRole.configuration[:available_roles].each do |role_name|
            define_method "#{role_name}_role?" do
              self.role == role_name.downcase
            end
          end
        end
      end
    end
  end
end
