require 'Vertex.rb'

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
    pop = verticies[pos].popNext
    
    while pop != nil
      currentVal = verticies[pos].getId
      
      val = pop - 1
      
      if verticies[val].touched == false
        traversal.add(pop)
        traversal = traverseTree(verticies, val, traversal)
      end
      
      pop = verticies[pos].popNext
    end
    
    return traversal
  end
end