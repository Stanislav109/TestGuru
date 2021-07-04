class RemoveGistUrlFromGists < ActiveRecord::Migration[6.1]
  def change
    remove_column :gists, :gist_url
  end
end
