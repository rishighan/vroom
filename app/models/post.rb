class Post < ActiveRecord::Base

    validates :title, presence: true, length: {minimum: 5}
    validates :content, presence: true
    validates :excerpt, presence: true
    has_and_belongs_to_many :categories
    accepts_nested_attributes_for :categories

    #attachments
    has_many :attachments, as: :imageable, dependent: :destroy
    #validate attachments
    #reject_if nested attributes are empty, dont write them to database.
    accepts_nested_attributes_for :attachments, :allow_destroy => true,
                                  :reject_if => proc { |attributes| attributes['picture'].blank? }
end
