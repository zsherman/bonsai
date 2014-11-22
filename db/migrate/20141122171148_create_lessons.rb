class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :video_url
      t.text :short_description
      t.text :description
      t.references :course
      t.timestamps
    end
  end
end
