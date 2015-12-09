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
    branch = Branch.find_by_organization_id(org_id)
    if branch.full_name == Organization.find(branch.organization_id).full_name
      return true
    else
      return false
    end
  end
end


