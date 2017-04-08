class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
<<<<<<< HEAD
      t.integer :user_id
=======
>>>>>>> master
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps null: false
    end
  end
end
