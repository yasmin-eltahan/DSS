class Version < ActiveRecord::Base
   attr_accessible :name, :year , :price , :system_id
   belongs_to :system
   has_many :spec_versions
end
