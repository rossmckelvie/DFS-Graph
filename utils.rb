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
    
    while $i < numVerts
      v = Vertex.new($i + 1)
      verticies.push v
      $i = $i + 1
    end
    
    return verticies
  end
  
  # Traverse a tree in DFS fashion
  def traverseTree(verticies, pos, traversal)
    verticies[pos].touch
    nextVert = verticies[pos].getNext
    
    while nextVert != nil
      currentVal = verticies[pos].getId
      
      val = nextVert - 1
      
      if verticies[val].touched == false
        traversal.add(nextVert)
        traversal = traverseTree(verticies, val, traversal)
      end
      
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