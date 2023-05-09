class ChangeBodyFromStringToTextOnCritics < ActiveRecord::Migration[7.0]
  def change
    reversible do |direction|
      direction.up { change_column :critics, :body, :text }
      direction.down { change_column :critics, :body, :string }
    end
  end
end
