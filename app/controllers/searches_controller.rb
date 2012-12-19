class SearchesController < ApplicationController
  def show
    @term = search_term
    @timeline = find_timeline
  end

  private

  def search_term
    search_params[:q]
  end

  def find_timeline
    Timeline.new(perform_search)
  end

  def perform_search
    Shout.search(search_params)
  end

  def search_params
    params[:search]
  end
end
