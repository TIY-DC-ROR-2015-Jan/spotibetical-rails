class AddVotesLeftToUsers < ActiveRecord::Migration
  def change
    add_column :users, :votes_left, :integer, null: false, default: 10
  end
end
