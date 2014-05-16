class Reason < ActiveRecord::Base
   attr_accessible :company_id, :user_id , :reason, :criterion_id
   belongs_to :user
end
