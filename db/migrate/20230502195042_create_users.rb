class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRptJezC3jOPsu_6IEZljbdTMc85j2gLvre0g&usqp=CAU'
      t.string :bio

      t.timestamps
    end
  end
end
