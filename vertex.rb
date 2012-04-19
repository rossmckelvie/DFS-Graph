#!/usr/bin/ruby

class Vertex
  @vertNum = -1
  @touches = Array.new
  
  def initialize(vnum)
    @vertNum = vnum
  end
  
  def add(vert)
    @touches.push vert
  end
end