class CreateUniversitiesInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :universities_infos do |t|
      t.string :web_page
      t.string :country
      t.string :domain
      t.string :name

      t.timestamps
    end
  end
end
