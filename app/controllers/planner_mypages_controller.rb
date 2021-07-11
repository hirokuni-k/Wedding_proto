class PlannerMypagesController < ApplicationController
  require 'happybirthday'

  def index
    planner = Planner.find(current_planner.id)
  end

  def show
    @planner = Planner.find(current_planner.id)
  end
end
