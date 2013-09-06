class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.references :user
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
