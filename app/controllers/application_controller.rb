# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[index show]

  protect_from_forgery with: :exception

  # This helper methods is for use a login page, out of the the
  # controller defined by devise
  helper_method :resource, :resource_name

  # Overide devise
  def resource_name
    :user
  end

  # Overide devise
  def resource
    @resource ||= User.new
  end
end
