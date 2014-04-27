class System < ActiveRecord::Base
   attr_accessible :name, :programming_language, :description, :no_of_users , :vendor_id
   has_many :system_technicals
   belongs_to :vendor
   has_many :versions
   has_many :reviews
   has_many :ranks
end
