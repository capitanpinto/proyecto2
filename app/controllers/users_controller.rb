class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
   if params[:content]
     @microposts =@user.microposts.where('content', "#{params[:content]}")
   else
     @microposts = @user.microposts
   end
  end
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Has actualizado tu perfil"
      redirect_to @user
    else
      render 'edit'
    end
  end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
  private
  
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end

 def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
 end
    
end
