class Version < ActiveRecord::Base
   attr_accessible :name, :year , :Price , :system_id , :spec_ids
   belongs_to :system
   has_many :specs , :through => :spec_versions
   has_many :spec_versions, :dependent => :destroy

   
   validates_presence_of :name, :year , :Price
end
