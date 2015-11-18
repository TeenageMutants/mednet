class Branch < ActiveRecord::Base
  def self.add_branch params
    @branch = Branch.create(organization_id: params[:organization_id], short_name: params[:short_name],
                            full_name: params[:full_name], senior_phone: params[:senior_phone],
                            address: params[:address])
  end



end
