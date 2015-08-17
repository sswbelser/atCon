class UsersController < ApplicationController

  # before_filter :authorize, only: [:show]
   # creates the singup form
  def new
    # redirect user if already logged in
    if current_user
      redirect_to conferences_path
    else
      render :new
    end
  end

# add new user to database
  def create
    # redirect user if already logged in
    if current_user
      redirect_to conferences_path
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        flash[:notice] = "Successfully signed up."
        redirect_to conferences_path
      else
        flash[:error] = user.errors.full_messages.join(', ')
        redirect_to signup_path
      end
    end
  end


  def update
    user = User.find(params[:id])
    if current_user
      flash[:notice] = "Successfully updated profile!"
      user.update_attributes(user_params)
      redirect_to profile_path
    else
      flash[:error] = user.errors.full_messages.join(', ')
      redirect_to edit_profile_path
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    if current_user
      flash[:error] = "Successfully deleted profile!"
      user.destroy
      redirect_to conferences_path
    end
  end

  def show
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end
end

