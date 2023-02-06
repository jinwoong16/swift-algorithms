//
//  Dijkstra.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/06.
//

import Foundation

class Dijkstra<T> where T: Hashable {
  private let graph: AbstractGraph<T>
  
  init(graph: AbstractGraph<T>) {
    self.graph = graph
  }
  
  func findShortestPaths(from start: Vertex<T>) {
    var currentVertices = graph.vertices
    var currentVertex: Vertex? = start
    
    var pathLengths = currentVertices.reduce(into: [Vertex<T>: Double]()) { partialResult, element in
      partialResult[element] = .infinity
    }
    pathLengths[start] = 0
    
    while let vertex = currentVertex {
      currentVertices = currentVertices.filter { $0 != vertex }

      let edges = graph.edgesFrom(vertex).filter { currentVertices.contains($0.to) }
      
      for edge in edges {
        guard let weight = edge.weight else { fatalError("no weight is found.") }
        let neighborVertex = edge.to
        
        let newWeight = pathLengths[vertex, default: .infinity] + weight
        
        if newWeight < pathLengths[neighborVertex, default: .infinity] {
          pathLengths[neighborVertex] = newWeight
        }
      }
      
      if currentVertices.isEmpty {
        currentVertex = nil
        break
      }
      currentVertex = currentVertices.min { pathLengths[$0, default: .infinity] < pathLengths[$1, default: .infinity] }
    }
    
    print(pathLengths.sorted { (first, second) in first.key.index < second.key.index })
  }
}
