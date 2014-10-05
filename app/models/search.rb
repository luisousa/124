class Search < ActiveRecord::Base


  validates :title, :url, presence: true
  
  belongs_to :user

end
