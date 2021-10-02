class TitlesController < ApplicationController

  def index
    # @comics = Comic.joins(title: :publisher, title: :character)
    # @titles = Title.joins(:publisher, :character)
    @titles = Title.all
  end

  def show
    @comics = Comic.where(title_id: params[:id]).order(:issue_number)
    @titles = Title.joins(:publisher, :character)
  end

  def create
  end

  def edit
    @title = Title.find(params[:id])
    @publishers = Publisher.all
    @characters = Character.all
  end

  def update
    title = Title.find(params[:id])
    title.update(publisher_id: params[:publisher_id], character_id: params[:character_id])
    redirect "/title/#{params[:id]}/edit"
  end

  def delete 
    @title = Title.find(params[:id])
  end

end
