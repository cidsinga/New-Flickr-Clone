
class AccountsController < ApplicationController
  before_action :authorize, only: [:index, :show]
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
    # binding.pry
    render :index
  end

  def new
    @account = Account.new
    render :new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      session[:account_id] = @account.id
      binding.pry
      if current_account.admin === true
        flash[:notice] = "Welcome, Admin"
      else
        flash[:notice] = "You've successfully signed up!"
      end
      redirect_to "/images"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def edit
    @account = Account.find(params[:id])
    render :edit
  end

  def show
    @account = Account.find(params[:id])
    render :show
  end

  def update
    @account= Account.find(params[:id])
    if current_account.admin === true
      if @account.update(account_params)
        redirect_to accounts_path
      else
        render :edit
      end
    else
      flash[:notice] = "You don't have those privileges."
    end
    render :show
  end

  def destroy
    session[:account_id] = nil
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to '/'
  end


  private

  def set_account
    @account = Account.find(params[:id])
  end
  def account_params
    params.require(:account).permit(:name, :email, :password, :admin)
  end
end
