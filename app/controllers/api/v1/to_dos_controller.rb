class Api::V1::ToDosController < ActionController::API
  def index
    @to_dos = ToDo.all
  end

  def update
    @to_do = ToDo.find(params[:id])
    if @to_do.update(to_do_params)
      render status: 200, json: { status: 200 }
    end
  end

  def destroy
    to_do = ToDo.find(params[:id])
    if to_do.destroy
      render status: 200, json: { status: 200 }
    end
  end

  private

  def to_do_params
    params.require(:to_do).permit(:finished)
  end
end
