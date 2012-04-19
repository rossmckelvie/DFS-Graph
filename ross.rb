#!/usr/bin/ruby
require 'vertex.rb'
require 'utils.rb'
require 'traversal.rb'

# variables
utils = Utils.new
count = 0
testFileName = ARGV[0]

# open file handler
inputFile = File.new(testFileName, "r")

# generate base data
numEdges = utils.readNumberFromFile(inputFile)
numVerts = utils.readNumberFromFile(inputFile)
verticies = utils.buildVerticiesArray(numVerts)


# loop thru lines of file to get verticies
# build verticies array
while (line = inputFile.gets)
  points = line.split
  pos = count - 2
    
  vert1 = Integer(points[0])
  vert2 = Integer(points[1])
    
  verticies[vert1 - 1].add(vert2)
  verticies[vert2 - 1].add(vert1)

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

traversal = Traversal.new(verticies[0].getId)
traversal = utils.traverseTree(verticies, 0, traversal)

pos = traversal.getNextPosInPath

while pos != nil
  puts pos
  pos = traversal.getNextPosInPath
end