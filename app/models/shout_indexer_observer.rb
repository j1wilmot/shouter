class ShoutIndexerObserver < ActiveRecord::Observer
  observe :shout

  def after_create shout
    index = shout.content.index
    SearchIndex.new(index: index).tap do |search_index|
      search_index.shout = shout
      search_index.save
    end
  end
end
