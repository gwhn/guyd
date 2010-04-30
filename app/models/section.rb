class Section < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Section', :foreign_key => 'parent_id'
  has_many :children, :class_name => 'Section', :foreign_key => 'parent_id'
  has_and_belongs_to_many :contents
end
