class PublicTimeline
  def initialize(timeline)
    @timeline = timeline
  end

  def shouts
    @timeline.shouts.where(public: true)
  end

  def to_partial_path
    @timeline.to_partial_path
  end
end
