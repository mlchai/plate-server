class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
