class RemoveFieldsFromWeathers < ActiveRecord::Migration[5.1]
  def change
    remove_column :weathers, :temperature
    remove_column :weathers, :condiiton
    remove_column :weathers, :image_id
  end
end
