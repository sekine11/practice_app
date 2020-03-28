class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :subject
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
