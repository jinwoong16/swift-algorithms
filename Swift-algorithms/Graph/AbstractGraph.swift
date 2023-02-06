//
//  AbstractGraph.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/05.
//

import Foundation

class AbstractGraph<T>: CustomStringConvertible where T: Hashable {
  required init() {}
  
  required init(fromGraph graph: AbstractGraph<T>) {
    for edge in graph.edges {
      let from = createVertex(edge.from.data)
      let to = createVertex(edge.to.data)
      
      addDirectedEdge(from, to: to, withWeight: edge.weight)
    }
  }
  
  var description: String {
    fatalError("abstract property accessed")
  }
  
  var vertices: [Vertex<T>] {
    fatalError("abstract property accessed")
  }
  
  var edges: [Edge<T>] {
    fatalError("abstract property accessed")
  }
  
  func createVertex(_ data: T) -> Vertex<T> {
    fatalError("abstract function called")
  }
  
  func addDirectedEdge(_ from: Vertex<T>, to: Vertex<T>, withWeight weight: Double?) {
    fatalError("abstract function called")
  }
  
  func addUndirectedEdge(_ vertices: (Vertex<T>, Vertex<T>), withWeight weight: Double?) {
    fatalError("abstract function called")
  }
  
  func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
    fatalError("abstract function called")
  }
  
  func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
    fatalError("abstract function called")
  }
}
