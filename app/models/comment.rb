class Comment < ApplicationRecord
  belongs_to :post


##Validations
validates_presence_of :body



end
