# author rossmckelvie
class Utils
  # read a line from a file as a number
  def readNumberFromFile(fileHandler)
    return Integer(fileHandler.gets)
  end
  
  # build array of initialized vertices
  def buildVerticesArray(numVerts)
    vertices = Array.new
    $i = 0
    
    # intialize numVerts new Vertex's and push onto array
    while $i < numVerts
      v = Vertex.new($i + 1)
      vertices.push v
      $i = $i + 1
    end
    
    return vertices
  end
  
  # Traverse a tree in DFS fashion
  def traverseTree(vertices, pos, traversal)
    # mark vertex as touched
    vertices[pos].touch
    
    # get the first next vertex
    nextVert = vertices[pos].getNext
    
    while nextVert != nil
      # get the vertex ID number
      currentVal = vertices[pos].getId
      
      # position is always off by one, since vertex start at 1
      val = nextVert - 1
      
      # add this one if it hasn't been touched yet and move on
      if vertices[val].touched == false
        # add to traversal path
        traversal.add(nextVert)
        
        # continue traversal thru this node
        traversal = traverseTree(vertices, val, traversal)
      end
      
      # get the next vertex deeper
      nextVert = vertices[pos].getNext
    end
    
    return traversal
  end
  
  # checks to see if everything's been touched
  def virginVertexExists(vertices, numVerts)
    $i = 0
    
    while $i < numVerts
      if !vertices[$i].touched
        return $i
      end
      $i = $i + 1
    end
    
    return -1
  end
end