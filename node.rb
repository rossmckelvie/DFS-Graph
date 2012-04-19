#!/usr/bin/ruby

class Edge
  # local data
  @vert1 = 0
  @vert2 = 0
  
  # constructor
  def initialize(v1, v2)
    @vert1 = v1
    @vert2 = v2
  end
  
  # prints out data
  def print
    puts "#{@vert1} --> #{@vert2}"
  end
end