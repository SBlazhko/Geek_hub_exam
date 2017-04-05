class SessionsController < ApplicationController

  def new
  end

  def create
    @account = Account.find_by(account_params)
    unless @account
      @account = Account.create(account_params)
      @account.update(user_id: user_params.id)
    end
    session[:user_id] = @account.user_id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end

  def account_params
    {
      uid: auth_params['uid'],
      provider: auth_params['provider']
    }
  end

  def user_params
    User.find_or_create_by(email: auth_params['info']['nickname'], 
                           token: auth_params["credentials"]["token"],
                           token_secret: auth_params["credentials"]["secret"] )
  end
end
