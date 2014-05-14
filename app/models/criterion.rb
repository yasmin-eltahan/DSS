class Criterion < ActiveRecord::Base
  attr_accessible :name, :description , :subcriterions_attributes
   has_many :company_criterions
   has_many :subcriterions
   has_many :companies, :through => :company_criterions
   accepts_nested_attributes_for :subcriterions , allow_destroy: true

  def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all , :order=>("name ASC"))
  end
end
end
