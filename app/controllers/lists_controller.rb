class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
      # Success
    else
      # Fail
      render :edit
    end
  end

  def new
    @list = List.new
  end

  def create
    # Take data from the form and create a new page in our database
    @list = List.new(list_params)
  
    if @list.save
      # success
      redirect_to lists_path
    else
      # fail
      render :new
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path
  end

  private

  def list_params
    # params[:page]
    params.require(:list).permit(:item, :done)
  end

end
