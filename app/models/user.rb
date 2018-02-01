class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :set_defaults

  ##Database Associations
  has_many :posts

  ##Validations

  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, :minimum => 3, :maximum => 30

  private

    def set_defaults
      self.type ||= 'User'
    end
end

