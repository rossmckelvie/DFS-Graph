#!/usr/bin/ruby

class Vertex
  @vertNum = -1
  @touches = Array.new
  
  def initialize(vnum)
    @vertNum = vnum
    @touches = Array.new
  end
  
  def add(vert)
    @touches.push vert
  end
  
  def printAdjacent
    puts "Verticies that touch #{@vertNum}:"
    
    @touches.each do |touch|
      puts "   #{touch}"
    end
  end
  
  def getId
    return @vertNum
  end
end