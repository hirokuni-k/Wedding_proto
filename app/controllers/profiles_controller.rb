class ProfilesController < ApplicationController
     def show
          @planner = Planner.find(current_planner.id)
          @planner_profile = Profile.where(@planner.profile)
          if @planner_profile.present?
               @profile = Profile.find(current_planner.id)
          end
     end
end
