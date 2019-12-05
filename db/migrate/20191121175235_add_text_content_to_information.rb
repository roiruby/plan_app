class AddTextContentToInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :information, :text_content, :text
  end
end
