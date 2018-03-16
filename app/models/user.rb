class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :set_defaults



  ##Database Associations
  has_many :posts
  has_many :comments

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy                                

  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower


  ##Validations 
  validates_presence_of :first_name, :last_name  #, :unless =>  :from_omniauth? 
  validates_length_of :first_name, :last_name, :minimum => 1, :maximum => 30 #, :unless =>  :from_omniauth? 

  def self.test
    5
  end

  def follow_test
    5
  end

  #Following methods
  def follow(other_user)
    p "dentro de User Model method follow"
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    puts 'inside from_omniauth'
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end



  private
  #  def from_omniauth?
  #   provider && uid 
  # end 


  def set_defaults
    self.type ||= 'User'
  end
end

