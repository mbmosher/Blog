class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :posttags
	has_many :tags, :through => :posttags
	validates :title, presence: true, length: {minimum: 5}
	
end
