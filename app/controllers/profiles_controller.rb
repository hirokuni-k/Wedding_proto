class ProfilesController < ApplicationController

  def new
    @planner = current_planner
    @profile = Profile.new
  end

  def create
    binding.pry
    profile = current_planner.build_profile(profile_params)
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
    params.require(:profile).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, 
      :gender_id, :prefecture_id, :birth_date, :bridal, :specialty, 
      :history, :favorite, :word, :image
    )
  end
end
