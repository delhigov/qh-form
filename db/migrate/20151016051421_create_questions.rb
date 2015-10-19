class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :status
      t.text :notes
      t.text :response
      t.date :session_date
      t.string :session_selected
      t.integer :ministry
      t.timestamps null: false
    end
  end
end
