class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :like]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.flaggings_count = 0
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def like
    @micropost_t = Micropost.find(params[:id])
    current_user.flag(@micropost_t)
     respond_to do |format|
      format.html { redirect_to (:back) }
      format.js {render inline: "location.reload();"}
    end
  end

  def unlike
    @micropost = Micropost.find(params[:id])
    current_user.unflag(@micropost)
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render inline: "location.reload(); "}
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end


  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
    
end