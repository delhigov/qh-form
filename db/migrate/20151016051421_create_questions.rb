class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :ministry
      t.text :text
      t.text :status
      t.text :notes
      t.text :response
      t.date :session_date
      t.string :session_selected
      t.string :email
      t.string :city
      t.string :district
      t.string :state
      t.string :name
      t.string :tracking_id
      t.timestamps null: false
    end
  end
end
