class AddFundingEligibilityToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :funding_eligibility, :boolean, default: false
  end
end
