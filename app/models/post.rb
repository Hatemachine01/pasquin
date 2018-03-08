class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings


  #Validations
  validates_presence_of :title, :body

  after_initialize :set_defaults


  def self.tagged_with(name)
    p 'Inside tagged_with' * 5
    Tag.find_by!(name: name).posts
  end

  def self.tag_counts
    p 'Inside tag_counts' * 5
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    p 'Inside tag_list' * 5
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    p 'Inside tag_list = names' * 5
    # p names
    # p "SELF #{self}"  
    # p names.split(',').map 
    # the method below takes an array as an input and .map will return
    # a new array of the same size, that's why self.tags is assigned to an array
    # and that's why it makes sense because an activerecord association class must be an array
    self.tags = names.split(',').map do |n|
      @tag = Tag.where(name: n.strip).first_or_create!
    end
     p @tag
     p "TAG.CLASS #{@tag.class}" 
     p "SELF.TAG #{self.tags}"
  end

  private

    def set_defaults
      self.likes ||= 0
      self.date  ||= Date.today
    end
end
