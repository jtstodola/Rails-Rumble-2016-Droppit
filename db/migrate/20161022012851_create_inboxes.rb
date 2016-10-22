class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.string :name
      t.string :remote_folder
      t.string :service

      t.timestamps null: false
    end
  end
end
