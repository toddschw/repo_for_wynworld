class ChangeSocialLinkToUser < ActiveRecord::Migration
  def change
    rename_column :users, :Social_links, :social_links
  end
end
