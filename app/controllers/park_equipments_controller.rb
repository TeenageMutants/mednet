class ParkEquipmentsController < ApplicationController
  before_filter :user_present, only: :index
  def user_present
    unless current_user.present?
      flash[:notice] = "Чтобы войти в подсистему, зарегистрируйтесь!"
      redirect_to root_path
    end
  end
  def index
    if params[:act] == 'create'
      # Octopus.using(:shard_one) do
      #   Office.create(office_params)
      # end

      render text: params.inspect
    end
  end



  private
    def office_params
      params.require(:office).permit(:number, :floor, :block, :branches_department_id, :is_deleted)
    end

end
