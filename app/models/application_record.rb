# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.inherited(child)
    super

    child.instance_eval do
      def not_miltitenant!
        @multitenant = false
      end

      def supports_multitenancy?
        @multitenant.nil? || @multitenant
      end
    end

    # this is used to trace the end of the child class

    trace = TracePoint.new(:end) do |tp|
      if tp.self == child

        trace.disable # when the required child class is found, tracing is disabled

        if child.supports_multitenancy? && ENV['TENANT_OVERRIDE'] != 'true'

          child.instance_eval do # opens child class and adds the default scope
            default_scope { where(company_id: Company.current_tenant_id) }
          end
        end
      end
    end
    trace.enable
  end
end
