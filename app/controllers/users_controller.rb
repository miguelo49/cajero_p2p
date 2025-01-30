class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(password: "123456", password_confirmation: "123456"))
    if @user.save
      log_in @user
      redirect_to exchanges_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "Datos actualizados exitosamente"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :bank_account, :address)
  end
end