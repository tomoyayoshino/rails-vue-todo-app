class ToDosController < ApplicationController
  before_action :set_to_do, only: [:edit, :update]

  def index
    @to_dos = ToDo.all
  end

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      redirect_to to_dos_path
    else
      render :new
    end
  end

  def edit;  end

  def update
    if @to_do.update(to_do_params)
      redirect_to to_dos_url
    else
      render :edit
    end
  end

  private

  def set_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:title)
  end
end
