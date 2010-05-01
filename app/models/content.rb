class Content < ActiveRecord::Base
  has_and_belongs_to_many :sections

  validates_presence_of :title, :body, :sections
end
