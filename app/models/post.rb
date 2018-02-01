class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  #Validations
  validates_presence_of :title, :body, :date

  after_initialize :set_defaults

  private

    def set_defaults
      self.likes ||= 0
    end
end
