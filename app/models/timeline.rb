class Timeline
  include ActiveModel::Conversion

  def initialize shouts
    @shouts = shouts 
  end

  def shouts()
    @shouts.current
  end
end
