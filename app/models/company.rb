# frozen_string_literal: true

class Company < ApplicationRecord
  not_miltitenant!
  validates :subdomain, uniqueness: true

  has_many :users
  has_many :articles
  has_many :comments

  # create tenant_id getter and setter

  def self.current_tenant_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_tenant_id
    Thread.current[:tenant_id]
  end
end
