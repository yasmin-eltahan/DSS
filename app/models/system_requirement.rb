class SystemRequirement < ActiveRecord::Base
   attr_accessible :system_id, :requirement_id ,:value
     belongs_to :system
     belongs_to :requirement

end
