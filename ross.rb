#!/usr/bin/ruby
require 'node.rb'

# variables
count = 0
numEdges = 0
numVerts = 0
edges = Array.new
testFileName = ARGV[0]

inputFile = File.new(testFileName, "r")

# loop thru lines of file
while (line = inputFile.gets)
  # read data into correct place
  if count == 0
    numEdges = line
  elsif count == 1
    numVerts = line
  else
    points = line.split
    edge = Edge.new(points[0], points[1])
    edges.push edge
  end
  
  # increase count
  count = count + 1
end
inputFile.close

# output input data
puts "edges: #{numEdges}"
puts "verts: #{numVerts}"

edges.each do|edge|
  edge.print
end

# output answer
puts "The connected components of #{testFileName} are:"