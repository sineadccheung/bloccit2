class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :questions, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
