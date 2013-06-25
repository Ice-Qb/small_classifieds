class AddEmailAddressToClassified < ActiveRecord::Migration
  def change
    add_column :classifieds, :email_address, :string
  end
end
