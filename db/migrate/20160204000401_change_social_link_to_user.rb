class ChangeSocialLinkToUser < ActiveRecord::Migration
  def change
    rename_column :users, :social_links, :social_links
  end
end
