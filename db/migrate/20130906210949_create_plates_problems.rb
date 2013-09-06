class CreatePlatesProblems < ActiveRecord::Migration
  def change
    create_table :plates_problems do |t|
      t.references :plate_id
      t.references :problem_id
    end
  end
end
