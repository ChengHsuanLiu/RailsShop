class Admins::BaseController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_shop

  private

  def get_shop
    @shop = current_admin.shop
  end
end
