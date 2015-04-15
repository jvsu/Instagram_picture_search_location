class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :user, index: true
      t.string :comment
      t.string :pic_source

      t.timestamps
    end
  end
end
