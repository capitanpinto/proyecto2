class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micro = current_user.microposts.build(micropost_params)
    if @micro.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      flash[:danger]= @micro.errors.full_messages.join(', ')
      redirect_to root_url
    end
  end

  def destroy
  end
  
  def search
   if params[:search].blank?  
     redirect_to(root_path, alert: "Empty field!") and return  
   else  
     @parameter = params[:search].downcase  
     @results = Micropost.all.where("lower(name) LIKE :search", search: @parameter) 
   end
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end

