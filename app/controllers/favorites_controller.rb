class FavoritesController < ApplicationController
before_action :logged_in_user

def show
  @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.save
    flash[:success] = "Favorited this Microposts!"
    redirect_to request.referrer || root_url
end

 def create
    @micropost = Micropost.find(params[:followed_id])
    current_micropost.favorite(@micropost)
 end

    
  def destroy
    @micropost = current_micropost.favorite_relationships.find(params[:id]).favorited
    current_favorite.unfavorite(@user)
  end
  
end
  