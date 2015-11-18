class Department < ActiveRecord::Base

  def self.add_department params
    @department = Department.create(name: params[:name])
  end
end
