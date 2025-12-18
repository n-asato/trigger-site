class Admin::SessionsController < ApplicationController
  layout 'admin'

  def new
    redirect_to admin_root_path if session[:admin_user_id]
  end

  def create
    username = params[:username]
    password = params[:password]

    if username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
      session[:admin_user_id] = "admin" # Simple session marker
      redirect_to admin_root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid username or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to admin_login_path, notice: "Logged out."
  end
end
