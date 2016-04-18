class Post < ActiveRecord::Base

  # validates_presence_of :name, :title
  # validates_length_of :title, :minimum => 5
  validates :name, :title, presence: true
  validates_length_of :title, minimum: 5
  has_many :comments  #moge otrzymac wszystie komentarze dla posta @post.comments, asocjacja:jeden post moze miec wiele komentarzy

end
