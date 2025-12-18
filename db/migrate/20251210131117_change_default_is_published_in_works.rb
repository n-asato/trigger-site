class ChangeDefaultIsPublishedInWorks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :works, :is_published, from: nil, to: false
  end
end
