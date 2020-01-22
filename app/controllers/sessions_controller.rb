class SessionsController < ApplicationController
  def create
    @account = Account.authenticate(params[:email], params[:password])
    if @account
      flash[:notice] = "You've signed in."
      session[:account_id] = @account.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:account_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to "/"
  end
end
