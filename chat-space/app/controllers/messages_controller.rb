class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(create_params)
  end


  private
  def create_params
    params.require(:message).permit(:body, :image).merge(user_id: current.user_id, group_id: params[:group_id])
  end
end
