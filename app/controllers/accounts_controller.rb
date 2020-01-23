
class AccountsController < ApplicationController
  before_action :authorize, only: [:index, :show]
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
    render :index
  end

  def new
    @account = Account.new
    render :new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:notice] = "You've successfully signed up!"
      session[:account_id] = @account.id
      if @account.admin = true
        flash[:notice] = "Welcome, Admin"
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
    if @account.update(account_params)
      redirect_to accounts_path
    else
      render :edit
    end
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
