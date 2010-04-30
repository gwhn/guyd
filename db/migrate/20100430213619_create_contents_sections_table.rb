class CreateContentsSectionsTable < ActiveRecord::Migration
  def self.up
    create_table :contents_sections, :id => false do |t|
      t.integer :content_id
      t.integer :section_id
    end
  end

  def self.down
    drop_table :contents_sections
  end
end
