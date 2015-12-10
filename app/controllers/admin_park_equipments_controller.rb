class AdminParkEquipmentsController < ApplicationController
  before_filter :user_admin

  def user_admin
    unless current_user.has_role? :admin
      redirect_to root_path, notice: "У вас недостаточно прав, чтобы войти в подсистему"
    end
  end


  def index
    redirect_to department_admin_park_equipments_path
  end

  def department
    @departments = Department.all.order(:name)
    @department = Department.new
  end

  def create_department
    if params[:commit] == 'добавить отдел'
      @department = Department.add_department(department_params)
      if @department.errors.present?
        render 'department', notice: "Не удалось добавить запись из-за ошибки"
      else
        redirect_to department_admin_park_equipments_path, notice: "Запись добавлена"
      end
    end
  end

  def edit_department
    @department = Department.find(params[:id])
    respond_to do |format|
      if @department.update_attributes(department_params)
        format.html { redirect_to(@department) }
        format.json { respond_with_bip(@department) }
      else
        format.html { render :action => "edit_department" }
        format.json { respond_with_bip(@department) }
      end
    end
  end

  def delete_department
    @department = Department.find(params[:id])
    @department.destroy
    flash[:success] = "Запись отдела удалена"
    redirect_to department_admin_park_equipments_path
  end

  def position
    @position = Position.new
    @positions = Position.all.order(:name)
  end

  def create_position
    if params[:commit] == 'добавить должность'
      @position = Position.add_positions(position_params)
      if @position.errors.present?
        render 'position', notice: "Не удалось добавить запись из-за ошибки"
      else
        redirect_to position_admin_park_equipments_path, notice: "Запись добавлена"
      end
    end
  end

  def edit_position
    @position = Position.find(params[:id])
    respond_to do |format|
      if @position.update_attributes(position_params)
        format.html { redirect_to(@position) }
        format.json { respond_with_bip(@position) }
      else
        format.html { render :action => "edit_position" }
        format.json { respond_with_bip(@position) }
      end
    end
  end

  def delete_position
    @position = Position.find(params[:id])
    @position.destroy
    flash[:success] = "Запись должности удалена"
    redirect_to position_admin_park_equipments_path
  end



  private
  def department_params
    params.require(:department).permit!
  end

  def position_params
    params.require(:position).permit!
  end

end
