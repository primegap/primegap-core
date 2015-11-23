class AddCompanyIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :company_id, :integer
    add_index :customers, :company_id
  end
end
