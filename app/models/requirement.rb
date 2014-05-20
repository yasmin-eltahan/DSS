class Requirement < ActiveRecord::Base

  attr_accessible :name, :type_id ,:description
  has_many :company_requirements, :dependent => :destroy
  has_many :systems, :through => :system_requirements
  has_many :system_requirements, :dependent => :destroy
  has_many :company_requirements, :dependent => :destroy
  has_many :companies, :through => :company_requirements

  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :type
end
