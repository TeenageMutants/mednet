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



    # i = 0
    # branch_id_arr = []
    # @branches.each do |br|
    #   branch_id_arr[i] = br.id
    #   i += 1
    # end
    # departments = BranchesDepartment.where(branch_id:[branch_id_arr])
    #
    # i = 0
    # dep_id_arr = []
    # departments.each do |dep|
    #   dep_id_arr[i] = dep.department_id
    #   i += 1
    # end
    # @departments = Department.find(dep_id_arr)





    Octopus.using(:shard_one) do
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

    if params[:commit].present?
      if params[:act] == 'create_branch'
        Branch.add_branch(params)

        # @branch = Branch.create(organization_id: params[:organization_id], short_name: params[:short_name],
        #                         full_name: params[:full_name], senior_phone: params[:senior_phone],
        #                         address: params[:address])
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

      if params[:act] == 'add_departments'
        if params[:check].present?
          render text: params.inspect
        end
      end
    end

    respond_to do |format|
      format.html
      format.js
    end

  end


  def search_dep
    @data_from_select1 = params[:branch]
    # flash[:danger]= '123'

    # dep_id = BranchesDepartment.where(:branch_id => @data_from_select1)
    # i = 0
    # dep_id_arr = []
    # while (i < dep_id.count) do
    #   dep_id_arr[i]=dep_id.find(i+1).department_id
    #   i += 1
    # end
    #
    # @departments = Department.find(dep_id_arr)
    #
    # render :json => @departments.map{|c| [c.id, c.short_name]}
  redirect_to office_park_equipments_path
  end






  private
    def office_params
      params.require(:office).permit!
    end

    def branch_params
      params.require(:branch).permit!
    end





end
