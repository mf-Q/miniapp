class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      
      t.text  :title
      t.text  :content
      t.date    :date
      t.timestamps
    end
  end
end
