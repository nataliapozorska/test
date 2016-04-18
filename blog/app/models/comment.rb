class Comment < ActiveRecord::Base

  belongs_to :post #asocjacja :kazdy komentarz nalezy do jednego posta

end
