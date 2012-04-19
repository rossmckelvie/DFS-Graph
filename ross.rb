#!/usr/bin/ruby
# author rossmckelvie
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
  # format: number[space]number --> split into two for conversion
  points = line.split
  
  # convert verticies from str to int
  vert1 = Integer(points[0])
  vert2 = Integer(points[1])
    
  # add vertex connections
  verticies[vert1 - 1].add(vert2)
  verticies[vert2 - 1].add(vert1)

  # increment counter
  count = count + 1
end

# close file handler
inputFile.close


# output heading, traverse tree and output
puts "The connected components of #{testFileName} are:"

# get first root node
root = utils.virginVertexExists(verticies, numVerts)

# loop until no verticies have been touched
while root != -1
  # blank output string
  str = nil
  
  # start new traversal
  traversal = Traversal.new(verticies[root].getId)
  
  # traverse the tree
  traversal = utils.traverseTree(verticies, root, traversal)

  # loop thru traversed path
  pos = traversal.getNextPosInPath
  while pos != nil
    str = "#{str} #{pos}"
    pos = traversal.getNextPosInPath
    
    # append comma if we aren't the last in path
    if pos != nil
      str = "#{str},"
    end
  end
  
  # output traversed path
  puts str
  
  # get next node to start traversal
  root = utils.virginVertexExists(verticies, numVerts)
end