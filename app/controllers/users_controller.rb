class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @protables = @user.prototypes
  end
end
