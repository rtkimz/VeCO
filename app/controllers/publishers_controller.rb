class PublishersController < ApplicationController

  def index
    @publishers = Publisher.all
  end

  def show
    @comics = Comic.joins(:title).where(title: {publisher_id: params[:id]}).order(:name)
    @char_set = {}
    @comics.each do |comic|
      @char_set.store(comic.title.character.id, comic.title.character.name)
    end
    temp_array = @char_set.sort_by(&:last)
    @char_set = temp_array.to_h
  end

end
