class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :course
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end
