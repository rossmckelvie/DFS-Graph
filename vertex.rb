#!/usr/bin/ruby

class Vertex
  @vertNum
  @touches # FIFO list
  @touched
  
  def initialize(vnum)
    @vertNum = vnum
    @touches = Array.new
    @touched = false
  end
  
  # add vertex
  #    only if larger than this one
  def add(vert)
    if vert > @vertNum
      @touches.push vert
    end
    
    @touches.sort!
  end
  
  # get vertex number
  def getId
    return @vertNum
  end
  
  # pulls first off of list
  def popNext
    pop = @touches.shift
    return pop
  end
  
  # tickle me
  def touch
    @touched = true
  end
  
  # have i been touched before?
  def touched
    return @touched
  end
  
  
  # debug print
  def printAdjacent
    puts "Verticies that touch #{@vertNum}:"
    
    @touches.each do |touch|
      puts "   #{touch}"
    end
  end
end