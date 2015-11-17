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
    @branches = Branch.where(organization_id: @org.id)
    # @departments = Department.all
    # @branch_id = Branch.find_by_organization_id(Userinfo.find_by_user_id(current_user.id).organization_id).id
    # @branchdepartments = BranchesDepartment.find_by_branch_id(@branch_id)

    # @dep_for_org = @branchdepartments
        # Department.find(branchdepartments.department_id)
    # @branches = Branch.where(organization_id: '4')

    #
    #
    # @offices = Office.using(:shard_one).all
    Octopus.using(:shard_one) do
      # @offices = Office.where(branches_department_id: (BranchesDepartment.where(:branch_id => @branches.id)))
      @office = Office.new
      if params[:act] == 'create_office'
        # render text: params.inspect
        @office = Office.create(office_params)
        if @office.errors.present?
          flash[:danger] = "Ошибки при заполнении формы"
          redirect_to office_park_equipments_path
        end
      end
    end

    @branch = Branch.new
    if params[:act] == 'create_branch'

      @branch = Branch.create(organization_id: params[:organization_id], short_name: params[:short_name],
                              full_name: params[:full_name], senior_phone: params[:senior_phone],
                              address: params[:address])
      if @branch.errors.present?
        flash[:danger] = "Ошибки при заполнении формы"
        redirect_to office_park_equipments_path
      end
      redirect_to office_park_equipments_path
    end

    if params[:act] == 'create_department'
      flash[:success] = "Отделы добавлены"
      redirect_to office_park_equipments_path
    end
  end


  def search_dep
    @data_from_select1 = params[:branch]
    # flash[:danger]= '123'

    dep_id = BranchesDepartment.where(:branch_id => @data_from_select1)
    i = 0
    dep_id_arr = []
    while (i < dep_id.count) do
      dep_id_arr[i]=dep_id.find(i+1).department_id
      i += 1
    end

    @departments = Department.find(dep_id_arr)

    render :json => @departments.map{|c| [c.id, c.short_name]}

  end






  private
    def office_params
      params.require(:office).permit!
    end

    def branch_params
      params.require(:branch).permit!
    end


end
