module ParkEquipmentsHelper
  def set_organization user_id
    org_id = Userinfo.find_by_user_id(user_id).organization_id
    org_name = Organization.find(org_id).short_name
    return org_name
  end

  def org_id
    org_id = Userinfo.find_by_user_id(current_user.id).organization_id
    return org_id
  end

<<<<<<< HEAD
<<<<<<< HEAD
  def get_branches
    Branch.where(organization_id: Organization.find(Userinfo.find_by_user_id(current_user.id).organization_id).id)
  end

  def get_departments branch_id
    i=rand(1)+1
      Department.where(id: BranchesDepartment.where(branch_id: i))
  end


  # def select_department branch_id
  #
  #   dep_id = BranchesDepartment.where(branch_id: branch_id)
  #   i = 0
  #   dep_id_arr = []
  #   while (i < dep_id.count) do
  #     dep_id_arr[i]=dep_id.find(i+1).department_id
  #     i += 1
  #   end
  #
  #   @departments = Department.find(dep_id_arr)
  #
  #   return @departments
  #
  #
  # end

  def branch_exist org_id
=======
=======
>>>>>>> origin/Klavakurochkina
  def find_branches
    orgid= Userinfo.find_by_user_id(current_user.id).organization_id
    @branches = Branch.where(organization_id: orgid)
    return @branches
  end


  def branch_only_one org_id
<<<<<<< HEAD
>>>>>>> origin/Klavakurochkina
=======
>>>>>>> origin/Klavakurochkina
    branch = Branch.find_by_organization_id(org_id)
    if branch.present?
      if branch.full_name == Organization.find(branch.organization_id).full_name and
         branch.short_name == Organization.find(branch.organization_id).short_name and
          branch.address == Organization.find(branch.organization_id).address
        return true
      else
        return false
      end
<<<<<<< HEAD
=======
    end
  end

  def find_departments_no_branches

    branch_id = Branch.find_by_organization_id(org_id).id
    find_departments(branch_id)
  end


  def find_departments branch_id
    departments = BranchesDepartment.where(branch_id: branch_id)
    dep_id_arr = []
    departments.each do |dep|
      dep_id_arr << dep.department_id
    end
    @departments = Department.find(dep_id_arr)
    return @departments
  end

  def find_offices branch_id, department_id
    br_dep_id = BranchesDepartment.where(branch_id: branch_id, department_id: department_id)

    br_dep_id_ar = []
    br_dep_id.each do |id|
      br_dep_id_ar << id.id
>>>>>>> origin/Klavakurochkina
    end
    @offices = Office.using(:shard_one).where(branches_department_id: br_dep_id_ar, is_deleted: false)
    return @offices
  end

  def find_departments_no_branches

    branch_id = Branch.find_by_organization_id(org_id).id
    find_departments(branch_id)
  end


  def find_departments branch_id
    departments = BranchesDepartment.where(branch_id: branch_id)
    dep_id_arr = []
    departments.each do |dep|
      dep_id_arr << dep.department_id
    end
    @departments = Department.find(dep_id_arr)
    return @departments
  end

  def find_offices branch_id, department_id
    br_dep_id = BranchesDepartment.where(branch_id: branch_id, department_id: department_id)

    br_dep_id_ar = []
    br_dep_id.each do |id|
      br_dep_id_ar << id.id
    end
    @offices = Office.using(:shard_one).where(branches_department_id: br_dep_id_ar, is_deleted: false)
    return @offices
  end
end


