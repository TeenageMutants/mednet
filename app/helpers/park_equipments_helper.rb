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

  def find_branches
    orgid= Userinfo.find_by_user_id(current_user.id).organization_id

    @branches = Branch.where(organization_id: orgid)
    return @branches
  end

  # def branch
  #   @branch = @branches.find(:first)
  #   return @branch
  # end


  def branch_only_one org_id
    branch = Branch.find_by_organization_id(org_id)
    if branch.full_name == Organization.find(branch.organization_id).full_name and
       branch.short_name == Organization.find(branch.organization_id).short_name and
        branch.address == Organization.find(branch.organization_id).address
      return true
    else
      return false
    end
  end

  def find_departments_no_branches

    branch_id = Branch.find_by_organization_id(org_id).id
    find_departments(branch_id)
  end


  def find_departments branch_id
    departments = BranchesDepartment.where(branch_id: branch_id)
    i = 0
    dep_id_arr = []
    departments.each do |dep|
      dep_id_arr[i] = dep.department_id
      i += 1
    end
    @departments = Department.find(dep_id_arr)
    return @departments
  end

  def find_offices branch_id, department_id
    br_dep_id = BranchesDepartment.where("branch_id=? AND department_id=?", branch_id, department_id)
    i = 0
    br_dep_id_ar = []
    br_dep_id.each do |id|
      br_dep_id_ar[i] = id.id
      i += 1
    end
    @offices = Office.using(:shard_one).where(branches_department_id: br_dep_id_ar)
    return @offices
  end


end


