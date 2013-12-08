# Primary Author: anuhyag
class Portfolio < ActiveRecord::Base
	belongs_to :user
	has_many :projects
	has_one :theme

  

    validates :user, presence: true
  def to_param
    user.username;
  end
    
end
