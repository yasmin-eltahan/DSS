class CompanyUsers < ActiveRecord::Base
  attr_accessible :company_id, :user_id , :role
  belongs_to :user
  belongs_to :company
end
