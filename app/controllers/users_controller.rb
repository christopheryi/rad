class UsersController < ApplicationController

  def index
    #will have template
    @users = User.all
  end

  def show
    #will have template
    @user = User.find(params[:id])
    
  end

  def new #will send user to a form
    #will have template
    @user = User.new
  end

  def create
    #will save and redirect
    @user = User.new(allowed_params)
    @user.save
    redirect_to user_path(@user)

  end

  def edit
    #will have template
    @user = User.find(params[:id])
    
  end

  def update
    #will save and redirect
    @user = User.find(params[:id])
    if @user.update_attributes(allowed_params)
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def allowed_params
      params.require(:user).permit(:first_name, :last_name, :age, :monthly_income, :monthly_expenses, :investments, :liquid_assets, :non_liquid_assets, :total_debt, :avg_debt_rate, :savings_goal)
    end
end

