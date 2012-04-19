#!/usr/bin/ruby
require 'vertex.rb'

# variables
count = 0
numEdges = 0
numVerts = 0
verticies = Array.new
testFileName = ARGV[0]

inputFile = File.new(testFileName, "r")

# loop thru lines of file
while (line = inputFile.gets)
  # read data into correct place
  if count == 0
    numEdges = Integer(line)
  elsif count == 1
    numVerts = Integer(line)
    $i = 0
    while $i < numVerts
      v = Vertex.new($i)
      verticies.push v
      $i = $i + 1
    end
  else
    points = line.split
    pos = count - 2
    
    vert1 = Integer(points[0])
    vert2 = Integer(points[1])
    
    verticies[vert1 - 1].add(vert2)
    verticies[vert2 - 1].add(vert1)
  end
  
  # increase count
  count = count + 1
end
inputFile.close

# output input data
puts "edges: #{numEdges}"
puts "verts: #{numVerts}"

verticies.each do |vert|
  vert.printAdjacent
end

# output answer
puts "The connected components of #{testFileName} are: s"