class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
