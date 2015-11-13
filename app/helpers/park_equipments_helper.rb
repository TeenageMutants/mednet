module ParkEquipmentsHelper
  def set_organization user_id
    org_id = Userinfo.find_by_user_id(user_id).organization_id
    org_name = Organization.find(org_id).short_name
    return org_name
  end

  def set_number_floor number
    i = 1
    number_floor = []
    while (i<number) do
      number_floor[i] =  i
      i += 1
    end
  end
end
