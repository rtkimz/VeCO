class CharactersController < ApplicationController

  def show
    @name = Character.find(params[:id]).name
    @titles = Title.joins(:publisher, :character).where(character_id: params[:id]).order(:name)
  end

end
