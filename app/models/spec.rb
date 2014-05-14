class Spec < ActiveRecord::Base
   attr_accessible :name, :description
   has_many :versions , :through => :spec_versions
   has_many :spec_versions

      def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all , :order=>("name ASC"))
	  end
	end
end
