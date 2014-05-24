class ChatsController < ApplicationController

  def index
  end

  def new
    @chat = Chat.new
    @chat.person = Person.new
  end

  def create
    @chat = Chat.new(chat_params)

    @chat.person = Person.where(chat_params[:person_attributes]).first_or_create

    if @chat.save
      login(@chat.person.email)
      @chat.invitations << Invitation.create(person: @chat.person, accepted: true)
      redirect_to chat_path(@chat)
    else
      render 'new'
    end
  end

  def show
    @chat = Chat.find_by_slug(params["id"])
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :date, :time, person_attributes: [ :email ])
  end

end
