class User < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
  def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

=======
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  #attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid 
 

#   def self.from_omniauth(auth)
#   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
#     user.provider = auth.provider
#     user.uid = auth.uid
#     user.name = auth.info.name
#     user.oauth_token = auth.credentials.token
#     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#     user.save!
#   end
# end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable


  # Setup accessible (or protected) attributes for your model

  # attr_accessible :title, :body

>>>>>>> b6ef979080ccc19a9f436267541cfc10fd8511b3
end
