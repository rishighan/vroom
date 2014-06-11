class Post < ActiveRecord::Base

    validates :title, presence: true, length: {minimum: 5}
    has_many :categories
    has_many :pictures
end
