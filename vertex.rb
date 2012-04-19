# author rossmckelvie
class Vertex
  @vertNum
  @touches # FIFO list
  @touched
  
  def initialize(vnum)
    @vertNum = vnum
    @touches = Array.new
    @touched = false
  end
  
  # add vertex and sort verticies by numer
  def add(vert)
    @touches.push vert
    @touches.sort!
  end
  
  # get vertex number
  def getId
    return @vertNum
  end
  
  # pulls first off of list
  def getNext
    return @touches.shift
  end
  
  # tickle me
  def touch
    @touched = true
  end
  
  # have i been touched before?
  def touched
    return @touched
  end
end