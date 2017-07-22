class MessagesController < ApplicationController
  before_action :set_group only: [:index, :create]
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(create_params)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def create_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
