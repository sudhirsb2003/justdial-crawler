class AddWebsiteNameToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :website_name, :string
  end
end
