class AddNoteToComapnies < ActiveRecord::Migration
  def change
    add_column :companies, :contact_first, :string
    add_column :companies, :contact_last, :string
    add_column :companies, :note, :note
    add_column :companies, :contact_email, :string
    add_column :companies, :tech_contact_f, :string
    add_column :companies, :tech_contact_l, :string
    add_column :companies, :tech_email, :string
    add_column :companies, :contact_phone, :string
  end
end
