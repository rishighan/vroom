class Post < ActiveRecord::Base

    validates :title, presence: true, length: {minimum: 5}
    has_and_belongs_to_many :categories
    accepts_nested_attributes_for :categories

    has_attached_file :picture,
                      :styles => {:medium => "350x", :thumb=> "100x" },
                      :default_url => "/images/:style/missing.png"

    validates_attachment_content_type :picture,
                                      :content_type => /\Aimage/,
                                      :size => {:in => 0..2048.kilobytes}

end
