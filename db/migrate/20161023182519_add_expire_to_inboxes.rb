class AddExpireToInboxes < ActiveRecord::Migration
  def change
    add_column :inboxes, :expire, :date
  end
end
