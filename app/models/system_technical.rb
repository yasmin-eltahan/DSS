class SystemTechnical < ActiveRecord::Base
   attr_accessible :system_id, :technical_id , :value
   belongs_to :system
   belongs_to :technical
end
