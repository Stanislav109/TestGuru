class AddSucessToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :sucess, :boolean, default: false
  end
end
