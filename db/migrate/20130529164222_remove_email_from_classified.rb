class RemoveEmailFromClassified < ActiveRecord::Migration
  def up
    remove_column :classifieds, :email
  end

  def down
    add_column :classifieds, :email, :string
  end
end
