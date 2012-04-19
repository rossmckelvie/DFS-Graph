class Utils
  def readNumberFromFile(fileHandler)
    return Integer(fileHandler.gets)
  end
  
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
end