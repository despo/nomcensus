class ChatsController < ApplicationController

  def index
  end

  def new
    @chat = Chat.new
    @chat.person = Person.new
  end

  def create
    @chat = Chat.new(chat_params)

    if logged_in?
      @chat.person = current_user
    else
      @chat.person = Person.where(chat_params[:person_attributes]).first_or_create
    end

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

    if logged_in?
      @invitation = current_user.invitations.where(chat: @chat).first
    elsif params[:token]
      @invitation = @chat.invitations.find_by_token(params[:token])
      login(invitation.person.email)
    end

    redirect_to root_path unless @chat
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :date, :time, person_attributes: [ :email ])
  end

end
