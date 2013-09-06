class CreatePlatesProblems < ActiveRecord::Migration
  def change
    create_table :plates_problems do |t|
      t.references :plate
      t.references :problem
    end
  end
end
