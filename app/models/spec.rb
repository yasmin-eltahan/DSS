class Spec < ActiveRecord::Base
   attr_accessible :name, :description
   has_many :spec_versions
end
