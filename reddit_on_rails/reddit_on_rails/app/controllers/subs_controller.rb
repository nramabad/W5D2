class SubsController < ApplicationController
  
  def index 
    @subs = Sub.all
  end 
  
  def new 
    @sub = Sub.new
  end 
  
  def edit 
    @sub = Sub.find(params[:id])
  end 
  
  def create 
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id 
    if @sub.save 
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end 
  
  def show 
    @sub = Sub.find(params[:id])
  end 
  
  def update 
    @sub = current_user.subs.find(params[:id])
    if @sub.update_attributes(sub_params) 
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end 
  
  private 
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end 
  
end
