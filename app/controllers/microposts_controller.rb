class MicropostsController < ApplicationController
  before_action :require_login

  def index
    @microposts = Micropost.order(created_at: :desc)
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to microposts_path, notice: "Micropost created!"
    else
      render index, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.microposts.find(params[:id]).destroy
    redirect_to microposts_path, notice: "Micropost deleted"
  end
    
  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def set_micropost
    @micropost = current_user.microposts.find(params[:id])
  end
end
