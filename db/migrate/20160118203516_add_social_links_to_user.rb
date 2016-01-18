class AddSocialLinksToUser < ActiveRecord::Migration
  def change
    add_column :users, :Social_links, :hstore
  end
end
