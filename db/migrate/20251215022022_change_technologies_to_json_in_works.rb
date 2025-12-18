class ChangeTechnologiesToJsonInWorks < ActiveRecord::Migration[7.1]
  def up
    # First, add a temporary column
    add_column :works, :technologies_json, :json, default: []

    # Migrate existing data
    Work.reset_column_information
    Work.find_each do |work|
      if work.technologies.present?
        # Assuming existing data is a simple string, wrap it in an array or split if comma-separated
        # Based on previous context, it seems to be treated as a single string description, but we want flexibility.
        # Let's split by comma if present, otherwise single item.
        techs = work.read_attribute(:technologies).to_s.split(',').map(&:strip).reject(&:blank?)
        work.update_columns(technologies_json: techs)
      end
    end

    # Remove old column and rename new one
    remove_column :works, :technologies
    rename_column :works, :technologies_json, :technologies
  end

  def down
    add_column :works, :technologies_string, :string

    Work.reset_column_information
    Work.find_each do |work|
      if work.technologies.present?
        # Join array back to string
        tech_str = work.read_attribute(:technologies).join(', ')
        work.update_columns(technologies_string: tech_str)
      end
    end

    remove_column :works, :technologies
    rename_column :works, :technologies_string, :technologies
  end
end
