class PlannersController < ApplicationController
  require 'happybirthday'

  def show
    @planner = Planner.find(params[:id])
  end
end
