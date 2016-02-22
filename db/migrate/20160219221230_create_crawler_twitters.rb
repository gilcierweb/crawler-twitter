class CreateCrawlerTwitters < ActiveRecord::Migration
  def change
    create_table :crawler_twitters do |t|
      t.text :content
      t.string :user
      t.string :tags
      t.datetime :publish

      t.timestamps null: false
    end
  end
end
