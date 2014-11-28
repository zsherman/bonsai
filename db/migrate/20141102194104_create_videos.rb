class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :lesson
      t.string :title
      t.string :url
      t.text :content
      t.string :instructor
      t.timestamps
    end
  end
end
