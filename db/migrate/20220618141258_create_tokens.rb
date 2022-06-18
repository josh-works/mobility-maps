class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :token_type
      t.string :access_token
      t.integer :expires_at
      t.integer :expires_in
      t.string :refresh_token
      t.references :mobility_network_user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
