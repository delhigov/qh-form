class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :ministry
      t.text :text
      t.integer :status
      t.text :notes
      t.text :response
      t.date :session_date
      t.string :session_selected
      t.timestamps null: false
    end
  end
end
