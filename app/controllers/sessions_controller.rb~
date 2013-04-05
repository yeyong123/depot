#encoding:utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
       session[:user_id] = user.id
       redirect_to admin_url
    else
      redirect_to login_url, alert: "用户名/密码不正确"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "退出登录"
  end
end
