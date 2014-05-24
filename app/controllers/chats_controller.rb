class ChatsController < ApplicationController

  def index
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      redirect_to chat_path(@chat)
    else
      render 'new'
    end
  end

  def show
    @chat = Chat.find_by_slug(params[:id])
  end

  private

  def chat_params
    params.require(:chat).permit(:name)
  end

end
