class CreateFreebies < ActiveRecord::Migration[6.1]
  def change
    create_table :freebies do |t|
      t.string :item_name 
      t.integer :value, :dev_id, :company_id
    end
  end
end
