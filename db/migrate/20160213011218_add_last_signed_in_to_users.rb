class AddLastSignedInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_signed_in, :datetime, default: DateTime.now
  end
end
