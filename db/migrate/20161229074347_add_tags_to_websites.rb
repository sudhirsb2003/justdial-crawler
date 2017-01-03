class AddTagsToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :tags, :string
  end
end
