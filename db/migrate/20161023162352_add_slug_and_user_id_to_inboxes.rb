class AddSlugAndUserIdToInboxes < ActiveRecord::Migration
  def change
    add_column :inboxes, :slug, :string
    add_reference :inboxes, :user, index: true, foreign_key: true
  end
end
