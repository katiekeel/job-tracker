class AddAttributesToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :name, :text
    add_column :contacts, :email, :text
    add_column :contacts, :position, :text
  end
end
