class AddHashToGist < ActiveRecord::Migration[6.1]
  def change
    add_column :gists, :gist_hash, :string
  end
end
