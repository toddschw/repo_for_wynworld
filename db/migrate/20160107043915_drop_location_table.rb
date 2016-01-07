class DropLocationTable < ActiveRecord::Migration
  def up
      drop_table :location
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
