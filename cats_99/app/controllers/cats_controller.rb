class CatsController < ApplicationController
  def index 
    @cats = Cat.all
    render :index
  end 
  
  def show 
    @cats = Cat.find(params[:id])
    
    if @cats 
      render :show
    else 
      redirect_to cats_url
    end 
  end 
  
  def new 
    @cat = Cat.new()
    render :new 
  end 
  
  def create 
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat) 
    else 
      render :new
    end 
  end 
  
  def update
    @cat = Cat.find(params[:id])
    
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else 
      render json: @cat.errors.full_messages, status: 422
    end 
  end 
  
  def edit 
    @cat = Cat.find(params[:id])
    if @cat
      render :edit
    else 
      redirect_to cats_url 
    end 
  end 
  
  private 
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end 
end 