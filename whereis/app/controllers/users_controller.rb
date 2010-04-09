class UsersController < ApplicationController

  def index
  end

  def show
  end
  
  def new
    @user = User.new
    @date = Time.now
  end

  def cretae
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
