class Type < ActiveRecord::Base
  attr_accessible :name, :technical , :description , :string , :requirements_attributes
  has_many :requirements ,:dependent => :destroy
  accepts_nested_attributes_for :requirements, :reject_if => lambda { |a| a[:name].blank? } , :allow_destroy => true


def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

  
end
