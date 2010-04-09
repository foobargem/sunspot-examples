class CreateDocs < ActiveRecord::Migration
  def self.up
    create_table :docs do |t|
      t.string :title
      t.text :content, :limit => 2.megabytes
      t.timestamps
    end
  end

  def self.down
    drop_table :docs
  end
end
