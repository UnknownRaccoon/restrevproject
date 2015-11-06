class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name, :null => false, :limit => 50
      t.string :address, :null => false, :limit => 100
      t.float :x, :null => false
      t.float :y, :null => false
      t.text :review, :null => false
      t.string :comment, :null => false, :limit => 50, :default => ''
      t.integer :mark1, :null => false, :limit => 1
      t.integer :mark2, :null => false, :limit => 1
      t.integer :mark3, :null => false, :limit => 1
      t.timestamps null: false
    end
  end
end
