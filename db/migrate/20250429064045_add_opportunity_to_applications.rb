class AddOpportunityToApplications < ActiveRecord::Migration[8.0]
  def change
    add_reference :applications, :opportunity, foreign_key: true
  end
end
