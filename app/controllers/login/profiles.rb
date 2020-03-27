class Login::ProfilesController < Login::ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to edit_login_profile_path, notice: 'Your profile has been successfully saved.'
    else
      render 'edit'
    end
  end

  def update
    if @profile.update(profile_params)
     redirect_to edit_login_profile_path, notice: 'Your profile has been successfully saved.'
   else
     render 'edit'
   end
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.build_profile
  end

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :introduction,
      :image,
      :image_cache
      :remove_image
    )
  end
end
