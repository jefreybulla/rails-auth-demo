# README

This demo shows how to set up a basic authentication strategy using has_secure_password method.

## Requirements

- Ruby 2.3.0
- sqlite3

## Build
```
$ bundle install
$ rails db:migrate
$ rails server
```

## User model
```
class User < ApplicationRecord
  has_secure_password
end
```

## Creating a new user
```
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
```
## Creating a session (authenticating an existing user)
```
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end
```
## has_secure_password docs
https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
