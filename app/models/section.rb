class Section < ActiveRecord::Base
  acts_as_tree :order => :name
  has_and_belongs_to_many :contents

  validates_presence_of :name
  validates_uniqueness_of :name

  
end
