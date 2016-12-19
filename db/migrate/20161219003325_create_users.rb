class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |x|
      x.string :first_name
      x.string :last_name
      x.string :age
      x.integer :monthly_income
      x.integer :monthly_expenses
      x.integer :investments
      x.integer :liquid_assets
      x.integer :non_liquid_assets
      x.integer :total_debt
      x.integer :avg_debt_rate
      x.integer :savings_goal
      x.timestamps
    end
  end
end
