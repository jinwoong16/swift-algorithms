//
//  AdjacencyMatrixGraph.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/05.
//

import Foundation

class AdjacencyMatrixGraph<T>: AbstractGraph<T> where T: Hashable {
  private var adjacencyMatrix: [[Double?]] = []
  private var _vertices: [Vertex<T>] = []
  
  required init() {
    super.init()
  }
  
  required init(fromGraph graph: AbstractGraph<T>) {
    super.init(fromGraph: graph)
  }
  
  override var vertices: [Vertex<T>] {
    return _vertices
  }
  
  override var edges: [Edge<T>] {
    var edges = [Edge<T>]()
    
    for row in 0..<adjacencyMatrix.count {
      for column in 0..<adjacencyMatrix.count {
        if let weight = adjacencyMatrix[row][column] {
          edges.append(Edge(from: vertices[row], to: vertices[column], weight: weight))
        }
      }
    }
    
    return edges
  }
  
  override func createVertex(_ data: T) -> Vertex<T> {
    let matchingVertices = vertices.filter { vertex in
      return vertex.data == data
    }
    
    if matchingVertices.count > 0 {
      return matchingVertices.last!
    }
    
    let vertex = Vertex(data: data, index: adjacencyMatrix.count)
    
    for i in 0..<adjacencyMatrix.count {
      adjacencyMatrix[i].append(nil)
    }
    
    let newRow = [Double?](repeating: nil, count: adjacencyMatrix.count + 1)
    adjacencyMatrix.append(newRow)
    
    _vertices.append(vertex)
    
    return vertex
  }
  
  override func addDirectedEdge(_ from: Vertex<T>, to: Vertex<T>, withWeight weight: Double?) {
    adjacencyMatrix[from.index][to.index] = weight
  }
  
  override func addUndirectedEdge(_ vertices: (Vertex<T>, Vertex<T>), withWeight weight: Double?) {
    addDirectedEdge(vertices.0, to: vertices.1, withWeight: weight)
    addDirectedEdge(vertices.1, to: vertices.0, withWeight: weight)
  }
  
  override func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
    return adjacencyMatrix[sourceVertex.index][destinationVertex.index]
  }
  
  override func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
    var outEdges = [Edge<T>]()
    let fromIndex = sourceVertex.index
    
    for column in 0..<adjacencyMatrix.count {
      if let weight = adjacencyMatrix[fromIndex][column] {
        outEdges.append(Edge(from: sourceVertex, to: vertices[column], weight: weight))
      }
    }
    
    return outEdges
  }
  
  override var description: String {
    var grid = [String]()
    let n = self.adjacencyMatrix.count
    for i in 0..<n {
      var row = ""
      for j in 0..<n {
        if let value = self.adjacencyMatrix[i][j] {
          let number = NSString(format: "%.1f", value)
          row += "\(value >= 0 ? " " : "")\(number) "
        } else {
          row += "  ø  "
        }
      }
      grid.append(row)
    }
    return (grid as NSArray).componentsJoined(by: "\n")
  }
}
