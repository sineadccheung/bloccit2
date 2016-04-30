class CreateSomethings < ActiveRecord::Migration
  def change
    create_table :somethings do |t|
      t.string :fish
      t.string :cake

      t.timestamps null: false
    end
  end
end
