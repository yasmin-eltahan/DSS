class Version < ActiveRecord::Base
   attr_accessible :name, :year , :Price , :system_id
   belongs_to :system
   has_many :spec_versions
end
