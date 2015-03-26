class UsersController < ApplicationController

  before_filter :extract_params, only: [:authenticate_user, :register_user]

  def authenticate_user

    # TODO
    register_new_session
    render json: {session_id: @session_id, user_alias: @user_alias}.to_json
  end

  #----------------------------------------
  def register_user

    pwd_confirm = params[:password_confirmation]

    if @password.empty?
      res = {error_message: 'password can not be empty'}
    else
      if @password != pwd_confirm
        res = {error_message: 'password is not the same'}
      else
        # TODO
        register_new_session
        res = {session_id: @session_id, user_alias: @user_alias}
      end
    end
    render json: res.to_json
  end

  #----------------------------------------
  private

    def extract_params
      @login = params[:login]
      @password = params[:password]
    end

    #----------------------------------------
    def register_new_session

      # TODO
      @session_id = SecureRandom.uuid
      @user_alias = @login
    end

end
