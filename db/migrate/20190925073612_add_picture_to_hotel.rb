class AddPictureToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :picture, :string
  end
end
