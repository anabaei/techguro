class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :tags
      t.string :count
      t.string :supplier
      t.string :stock

      t.timestamps
    end
  end
end
