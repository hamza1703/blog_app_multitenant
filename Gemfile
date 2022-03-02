# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'devise', '~> 4.8.1'

gem 'rails', '~> 6.0.4', '>= 6.0.4.6'

gem 'mysql2', '~> 0.5'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'will_paginate', '=3.3.0'
gem 'audited', '~> 4.2', '>= 4.2.1'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'cancancan', '~> 3.3.0'
gem 'jbuilder', '~> 2.7'
gem 'pry', '~> 0.14.1'
gem 'breadcrumbs_on_rails'
gem 'sequenceid', '=0.0.7', git: "https://github.com/alisyed/sequenceid.git", branch: 'feature/change_activerecord_base_to_applicationrecord_in_sti_parent_class_method'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 5.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
