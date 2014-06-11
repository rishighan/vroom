class Post < ActiveRecord::Base

    validates :title, presence: true, length: {minimum: 5}
    has_and_belongs_to_many :categories
    accepts_nested_attributes_for :categories

end
