class ParkEquipmentsController < ApplicationController

  before_filter :user_present
  def user_present
    unless current_user.present?
      flash[:danger] =  "Чтобы войти в подсистему, авторизуйтесь!"
      redirect_to root_path
    end
  end


  def index

  end

  def office
    @org = Organization.find(Userinfo.find_by_user_id(current_user.id).organization_id)

    # @branches = Branch.where(organization_id: @org.id)
    @departments_all = Department.all

    # @branch_name = Branch.find(params[:branch_id]) if params[:branch_id].present?
    @department = Department.find(params[:department_id]) if params[:department_id].present?



  end


  def search_office
    if params[:commit].present?
      flash[:success] == "Search"
      # render text: params.inspect
      @offices = Office.office_search(params)
      render 'search_office'
    end
  end


  def show_office
    @office = Office.using(:shard_one).find(params[:id])
    br_dep_id = @office.branches_department_id
    br_dep = BranchesDepartment.find(br_dep_id)
    @branch = Branch.find(br_dep.branch_id)
    @department = Department.find(br_dep.department_id)
  end

  # def create_office
  #   if params[:commit] == 'добавить кабинет'
  #     # render text: params.inspect
  #     # @office_branch_department_id = BranchesDepartment.find_by_branch_id(params[:office_branch_id])
  #     flash[:danger] = "Запись для кабинета создана"
  #     # render text: params.inspect
  #     # if @branch_department.errors.present?
  #     #   flash[:danger] = "Ошибки при заполнении формы"
  #     # end
  #     redirect_to office_park_equipments_path
  #   end
  # end

  def create_branch
    if params[:commit] == 'добавить филиал'
        @branch = Branch.create(branch_params)
        flash[:success] = "Запись для филиала создана"
        # render text: params.inspect
        if @branch.errors.present?
          flash[:danger] = "Ошибки при заполнении формы"
        end
       redirect_to office_park_equipments_path
    end
  end

  def show_branch
    @branch = Branch.find(params[:id])
  end


  def create_department
    if params[:commit].present?
      @branch_department = BranchesDepartment.create(branches_department_params)
      flash[:success] = "Запись связки создана"
      # render text: params.inspect
      if @branch_department.errors.present?
        flash[:danger] = "Ошибки при заполнении формы"
      end
    end
    redirect_to office_park_equipments_path
  end

  def add_office
    if params[:commit] == 'добавить кабинет'
      department_id = params.require(:department).require(:branch_id).to_i
      @bra_dep = BranchesDepartment.where(branch_id: params[:branch],department_id: department_id).first

      @office = Office.using(:shard_one).create(branches_department_id: @bra_dep.id, number: params[:number],
          floor: params[:floor], block: params[:block], is_deleted: false)

      flash[:success] = "Запись для кабинета создана"

      if @office.errors.present?
        flash[:danger] = "Ошибки при заполнении формы кабинета"
      end
      redirect_to office_park_equipments_path
    end

  end

  def delete_office
    @office = Office.using(:shard_one).find(params[:id])

    @office.update_attributes!(id: params[:id], is_deleted: true)

    redirect_to office_park_equipments_path
  end

  def edit_office
    @office = Office.using(:shard_one).find(params[:id])
    @office_br_dep_id = @office.branches_department_id


    @branch_id = BranchesDepartment.find(@office_br_dep_id).branch_id
    @department_id = BranchesDepartment.find(@office_br_dep_id).department_id



    if params[:commit] == 'изменить кабинет'
      department_id = params.require(:department).require(:branch_id).to_i
      if BranchesDepartment.where(branch_id: params[:branch],department_id: department_id).first.present?
        @bra_dep = BranchesDepartment.where(branch_id: params[:branch],department_id: department_id).first
        @office = @office.update_attributes!(branches_department_id: @bra_dep.id, number: params[:number],
                                             floor: params[:floor], block: params[:block], is_deleted: false)
        flash[:success] = "Запись для кабинета обновлена"
      else
        flash[:danger] = "Проверьте заданные параметры. Для вашей организации не задано такого сочетания филиала и отдела"
      end


      redirect_to office_park_equipments_path
    end

  end


  private
    def office_params
      params.require(:office).permit!
    end

    def branch_params
      params.require(:branch).permit!
    end

    def branches_department_params
      params.require(:branches_department).permit!
    end


end
