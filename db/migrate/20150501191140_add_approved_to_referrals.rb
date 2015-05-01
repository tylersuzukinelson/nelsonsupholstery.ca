class AddApprovedToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :approved, :boolean
  end
end
