class ProfilesController < ApplicationController

     def new
          @profile = Profile.new
     end

     def create
          profile = Profile.create(profile_params)
          if profile.save
               redirect_to profile_path(current_planner)
          else
               render 'new'
          end
     end

     def show
          @planner = Planner.find(current_planner.id)
          @planner_profile = Profile.where(planner_id: @planner.id)
          if @planner_profile.present?
               @profile = current_planner.profile
          end
     end

     private

     def profile_params
          params.require(:profile).permit(
               :last_name, :first_name, :last_name_kana, :first_name_kana, :gender_id, :prefecture_id, :birth_date, :bridal, :specialty, :history, :favorite, :word, :image).merge(
               planner_id: current_planner.id)
     end
end
