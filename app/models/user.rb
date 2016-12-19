class User < ActiveRecord::Base
  belongs_to :reetcher
  def user_name
    "#{self.first_name}"
  end

  def monthly_savings
    self.monthly_income - self.monthly_expenses
  end

  def yearly_savings
    (self.monthly_income - self.monthly_expenses) * 12
  end

  def one_year_liquid_total
    if self.liquid_assets.nil?
      ((self.monthly_income - self.monthly_expenses) * 12)
    else
    ((self.monthly_income - self.monthly_expenses) * 12) + self.liquid_assets
    end
  end

  def cash_debt_ratio
    @ratio = self.total_debt / (self.liquid_assets.to_f + self.non_liquid_assets)
    if @ratio >= 0.5
      "Your debt ratio of #{@ratio.round(2)} is much too high as you have increased your financial leverage to a high level. Unless this debt comes from a low-interest rate student loan, you need to lower this balance immediately."
    elsif @ratio >= 0.3
      "Your debt ratio of #{@ratio.round(2)} is alright. Keep paying your debt off as quickly as possible."
    else
      "Your debt ratio of #{@ratio.round(2)} is good. Keep it up."
    end
  end
  
  def net_worth
    self.investments + self.liquid_assets + self.non_liquid_assets - self.total_debt
  end
  
  def short
    self.savings_goal - self.net_worth
  end
  
  def short_yr_1
    self.savings_goal - self.net_worth - (self.yearly_savings * 1)
  end
  def short_yr_2
    self.savings_goal - self.net_worth - (self.yearly_savings * 2)
  end
  def short_yr_3
    self.savings_goal - self.net_worth - (self.yearly_savings * 3)
  end
  def short_yr_4
    self.savings_goal - self.net_worth - (self.yearly_savings * 4)
  end
  def short_yr_5
    self.savings_goal - self.net_worth - (self.yearly_savings * 5)
  end
  
  def net_worth_yr_1
    (self.liquid_assets + self.non_liquid_assets - self.total_debt) + self.yearly_savings
  end
  def net_worth_yr_2
    (self.liquid_assets + self.non_liquid_assets - self.total_debt) + (self.yearly_savings * 2)
  end
  def net_worth_yr_3
    (self.liquid_assets + self.non_liquid_assets - self.total_debt) + (self.yearly_savings * 3)
  end
  def net_worth_yr_4
    (self.liquid_assets + self.non_liquid_assets - self.total_debt) + (self.yearly_savings * 4)
  end
  def net_worth_yr_5
    (self.liquid_assets + self.non_liquid_assets - self.total_debt) + (self.yearly_savings * 5)
  end
  def months_to_goal
    ((self.savings_goal - self.net_worth) / self.monthly_savings) 
  end
  
  def years_to_goal
    (((self.savings_goal - self.net_worth) / self.monthly_savings) / 12 )
  end
     
  def emergency_goal
    @short = 5000 - self.liquid_assets
    if self.liquid_assets > 5000
      "It's fantastic you've saved enough, especially for an emergency."
    else
      "Put away 10% of everything you make into a emergency_pool until you've reached $5,000 in liquid assets. You are currently short by $#{@short}."
    end
    
  end
  
  def asset_to_debt_ratio
  end
  
  def yearly_debt_total
    if (self.avg_debt_rate.to_f * self.total_debt * 0.01).round(2).to_s.split(".").last.length > 1
      (self.avg_debt_rate.to_f * self.total_debt * 0.01).round(2)
    else
      (self.avg_debt_rate.to_f * self.total_debt * 0.01).round(2)
    end
  end
  
  def formatter(num)
    if num.round(2).to_s.split(".").last.length <= 1
      "0"
    end
  end
  
end
