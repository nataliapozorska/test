class Post < ActiveRecord::Base

  # validates_presence_of :name, :title
  # validates_length_of :title, :minimum => 5
  validates :name, :title, presence: true
  validates_length_of :title, minimum: 5

end
