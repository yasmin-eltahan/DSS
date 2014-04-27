class SpecVersion < ActiveRecord::Base
   attr_accessible :spec_id, :version_id
   belongs_to :spec
   belongs_to :version
end
