class AddServiceTagsToWorks < ActiveRecord::Migration[7.1]
  def change
    add_column :works, :service_tags, :json
  end
end
