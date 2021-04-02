class PlannerMypagesController < ApplicationController

     require 'happybirthday'

     def index
          @planner = Planner.find(current_planner.id)
     end

     def show
          @planner = Planner.find(current_planner.id)
          birthday = Happybirthday.born_on(current_planner.birth_date)
          @birthday = birthday.age.years_old
     end
end
