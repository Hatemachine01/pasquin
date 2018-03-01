class Comment < ApplicationRecord

#Each comment only has one unique post

  belongs_to :post

#Each comment only has one unique user
  belongs_to :user


##Validations
validates_presence_of :body



end
