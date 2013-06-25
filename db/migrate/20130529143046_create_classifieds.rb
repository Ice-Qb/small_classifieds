class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.text :content
      t.string :email
      t.string :city
      t.string :address
      t.integer :user_id

      t.timestamps
    end
    add_index :classifieds, [:user_id, :created_at]
  end
end
