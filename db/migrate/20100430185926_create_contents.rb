class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :title
      t.text :excerpt
      t.text :body
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
