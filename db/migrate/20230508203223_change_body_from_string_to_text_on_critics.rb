class ChangeBodyFromStringToTextOnCritics < ActiveRecord::Migration[7.0]
  def change
    change_column :critics, :body, :text
  end
end
