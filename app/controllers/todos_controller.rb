# todos_controller.rb
class TodosController < ApplicationController
  def index
    #render plain: "Hello, this is /todos! #{DateTime.now}"
    render plain: Todo.all.to_a
  end
end
