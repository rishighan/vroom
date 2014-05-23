class Post < ActiveRecord::Base

    validates :title, presence: true, length: {minimum: 25}
end
