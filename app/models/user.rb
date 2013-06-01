require "open-uri"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, :timeoutable and 
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  devise :database_authenticatable, :registerable,:token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable , :omniauth_providers => [:facebook]
  attr_accessible :provider, :uid, :name, :email, :password, :password_confirmation, :remember_me  , :home_city,:home_country 
  has_many :activities


def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  puts auth.inspect
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         home_city: auth.extra.raw_info.hometown.name.split(",").first.strip(),
                         home_country: auth.extra.raw_info.hometown.name.split(",").last.strip(),
                         email:auth.info.email,
                         avatar:open(auth.info.image),
                         password:Devise.friendly_token[0,20]
                         )
  end
  user
end
  
  
end
