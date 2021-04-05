class ProfilesController < ApplicationController
     def show
          @planner = Planner.find(current_planner.id)
     end
end
