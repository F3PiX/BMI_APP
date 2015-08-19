class RenameLengthToHeight < ActiveRecord::Migration
  def change
    rename_column :people, :length, :height
  end
end
