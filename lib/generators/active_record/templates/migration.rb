class Create<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table :<%= table_name %> do |t|
      t.string  :app_name,  null: false
      t.string  :section,   null: false
      t.string  :path,      null: false
      t.string  :name,      null: false
      t.string  :value,     null: false
      t.string  :note

      t.timestamps
    end

    add_index :<%= table_name %>, [:app_name, :section, :path, :name], unique: true
  end
end
