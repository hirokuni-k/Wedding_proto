class ProfilesController < ApplicationController

  def new
    @planner = current_planner
    @profile = Profile.new
  end

  def create
    profile = Profile.new(profile_params.merge(planner_id: current_planner.id))
    if profile.save
      redirect_to profile_path(current_planner)
    else
      render 'new'
    end

  end

  def show
    @planner = Planner.find(params[:planner_id])
    @profile = @planner.profile
  end

  private

  def profile_params
    params.permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, 
      :gender_id, :prefecture_id, :birth_date, :bridal, :specialty, 
      :history, :favorite, :word, :image
    )
  end
end
