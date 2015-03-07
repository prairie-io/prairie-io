class SchemaCleanup < ActiveRecord::Migration
  def change
    drop_table :charges
    drop_table :invoices
    drop_table :line_items
    drop_table :omni_auth_providers
    drop_table :stripe_cards
    drop_table :subscription_plans
    drop_table :subscriptions
    remove_column :users, :account_balance_cents
    remove_column :users, :account_balance_currency
    remove_column :users, :sash_id
    remove_column :users, :level
  end
end
