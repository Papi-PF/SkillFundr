class AddFundingEligibilityToUsers < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:users, :funding_eligibility)
      add_column :users, :funding_eligibility, :boolean, default: false
    end
  end
end
