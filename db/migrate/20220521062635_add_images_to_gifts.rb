class AddImagesToGifts < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :images, :json
  end
end
