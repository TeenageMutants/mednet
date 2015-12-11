class Position < ActiveRecord::Base
  has_many :userinfo
  def self.add_positions params
    Position.create(name: params[:name])
  end

end
