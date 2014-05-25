class PlacesController < ApplicationController

  def new
    @chat = Chat.find_by_slug(chat_id)
    @place = Place.new
  end

  def create
    chat_id = params[:chat_id]
    @chat = Chat.find_by_slug(chat_id)
    @place = Place.new(place_params)

    if @place.save
      if @chat
        @chat.places << @place
        redirect_to @chat
      else
        redirect_to @place
      end
    else
      render partial: 'places/new'
    end
  end

  def vote
    render json: "", status: :forbidden and return unless logged_in?

    @chat = Chat.find_by_slug(chat_id)
    @place = Place.find(place_id)

    chatplace = Vote.where(chat: @chat, person: current_user).first_or_create
    chatplace.update_attribute(:place_id, @place.id)

    render partial: 'chats/places', locals: { chat: @chat }
  end

  private
  def place_params
    params.require(:place).permit(:name, :address)
  end

  def chat_id
    params[:chat_id]
  end

  def place_id
    params[:place_id]
  end
end
