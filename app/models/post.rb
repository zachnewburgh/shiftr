class Post < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments

  has_many :post_tags
  has_many :tags, through: :post_tags

  accepts_nested_attributes_for :tags, reject_if: proc {|attributes| attributes[:name].blank?}

  validates :title, presence: true
  validates :body, presence: true

  def name=(name)
    write_attribute(name: name.upcase)
  end

end
