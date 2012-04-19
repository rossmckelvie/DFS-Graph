# author rossmckelvie
class Traversal
  @path
  
  def initialize(spot)
    @path = Array.new
    @path.push spot
  end
  
  def add(vertex)
    @path.push vertex
  end
  
  def getPath
    return @path
  end
  
  def getNextPosInPath
    return @path.shift
  end
end