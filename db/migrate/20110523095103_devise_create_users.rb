class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :name
      t.string  :location
      t.string  :introduction
      t.integer :followers_count, :default => 0
      t.integer :followed_count, :default => 0
      t.integer :messages_count, :default => 0
      t.integer :comments_count, :default => 0
      t.boolean :is_admin, :default => false

      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Encryptable
      # t.string :password_salt

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Token authenticatable
      t.string :authentication_token

      ## Invitable
      # t.string :invitation_token

      t.timestamps
    end

    add_index :users, :username,             :unique   => true
    add_index :users, :name
    add_index :users, :email,                :unique   => true
    add_index :users, :location
    add_index :users, :is_admin
    add_index :users, :reset_password_token, :unique   => true
    add_index :users, :confirmation_token,   :unique   => true
    add_index :users, :authentication_token, :unique   => true
  end
end
