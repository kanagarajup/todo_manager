# todos_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #render plain: "Hello, this is /todos! #{DateTime.now}"
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    response_text = "Hey, your new user is created with the id #{new_user.id} and name #{new_user.name} "
    render plain: response_text
  end

  def update
    id = params[:id]
    password = params[:password]
    user = User.find(id)
    user.password = password
    user.save!
    render plain: "Updated password of user #{id}"
  end

  def login
    user = User.find_by(email: params[:email], password: params[:password])
    render plain: user.present?
  end
end
