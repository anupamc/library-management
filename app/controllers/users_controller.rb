class UsersController < ApplicationController
	before_action :set_user, only: [:show]

	def index
	  @users = User.all
	end

	def new
	  @user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	  	redirect_to users_path, flash: {notice: 'User was successfully created.'}
	  else
	  	render :new
	  end
	end

  def search_user

  end

  def search_user_result
		@user = User.find_by_name(params[:name])
		if @user
			redirect_to user_path(@user, id: @user.id), flash: {notice: 'User found!'}
		else
			flash[:error] = 'No user found!'
			render :search_user
		end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_user
	    @user = User.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def user_params
	    params.require(:user).permit(:name)
	  end
end
