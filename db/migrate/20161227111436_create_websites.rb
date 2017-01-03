class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :name
      t.string :contact
      t.text :address
      t.string :agent_name

      t.timestamps
    end
  end
end
