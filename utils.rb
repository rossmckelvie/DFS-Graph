# author rossmckelvie
class Utils
  # read a line from a file as a number
  def readNumberFromFile(fileHandler)
    return Integer(fileHandler.gets)
  end
  
  # build array of initialized verticies
  def buildVerticiesArray(numVerts)
    verticies = Array.new
    $i = 0
    
    # intialize numVerts new Vertex's and push onto array
    while $i < numVerts
      v = Vertex.new($i + 1)
      verticies.push v
      $i = $i + 1
    end
    
    return verticies
  end
  
  # Traverse a tree in DFS fashion
  def traverseTree(verticies, pos, traversal)
    # mark vertex as touched
    verticies[pos].touch
    
    # get the first next vertex
    nextVert = verticies[pos].getNext
    
    while nextVert != nil
      # get the vertex ID number
      currentVal = verticies[pos].getId
      
      # position is always off by one, since vertex start at 1
      val = nextVert - 1
      
      # add this one if it hasn't been touched yet and move on
      if verticies[val].touched == false
        # add to traversal path
        traversal.add(nextVert)
        
        # continue traversal thru this node
        traversal = traverseTree(verticies, val, traversal)
      end
      
      # get the next vertex deeper
      nextVert = verticies[pos].getNext
    end
    
    return traversal
  end
  
  # checks to see if everything's been touched
  def virginVertexExists(verticies, numVerts)
    $i = 0
    
    while $i < numVerts
      if !verticies[$i].touched
        return $i
      end
      $i = $i + 1
    end
    
    return -1
  end
end