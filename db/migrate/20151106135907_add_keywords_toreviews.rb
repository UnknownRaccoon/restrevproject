class AddKeywordsToreviews < ActiveRecord::Migration
  def change
 add_column :reviews, :keywords, :string
  end
end
