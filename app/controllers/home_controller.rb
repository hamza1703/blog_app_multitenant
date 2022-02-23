class HomeController < ApplicationController
	def index
	  binding.pry
	  render "home/index"
	end

	def show
		binding.pry
		# @companies = User.select('companies.name,companies.subdomain').where(email: params[:email]).joins("INNER JOIN companies ON companies.id = users.company_id")
		@companies = User.unscoped.select('companies.name, companies.subdomain').where(email: params[:email]).joins(:company)

	end
end
