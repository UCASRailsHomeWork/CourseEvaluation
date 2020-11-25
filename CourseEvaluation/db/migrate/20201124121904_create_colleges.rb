class CreateColleges < ActiveRecord::Migration[6.0]
  def change
    create_table :colleges do |t|
      t.string :name, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :colleges
  end
end
