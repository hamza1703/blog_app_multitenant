# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: :find_user_companies

  def index; end

  def find_user_companies; end
end
