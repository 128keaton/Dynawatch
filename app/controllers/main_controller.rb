class MainController < ApplicationController
  # idfag
  protect_from_forgery with: :null_session

  def index
    title('Dynawatch')
    @nodes = Node.all
  end

  def update
    if Node.find_by(name: params[:name]) && params[:count]
      node = Node.where(name: params[:name]).first
      node.update(count: params[:count])
      return_success(node)
    elsif Node.find_by(name: params[:name]) == nil && params[:count]
      create
    else
      return_fail
    end
  end

  def create
    new_node = Node.new(count: params[:count], name: params[:name])
    if new_node.save
      return_success(new_node)
    else
      return_fail
    end
  end

  def get_number
    render html: Node.where(name: params[:name]).first.count
  end

  private

  def title(title)
    @title = title
  end

  def return_success(object)
    render json: object
  end

  def return_fail
    render json: { success: false }.as_json
  end
end
