//
//  breadthFirstSearch.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/05.
//

import Foundation

func breadthFirstSearch<T>(_ graph: AbstractGraph<T>, source: Vertex<T>) -> [T] {
  var queue = Queue<Vertex<T>>()
  var visited = [Vertex<T>: Bool]()
  queue.enqueue(source)
  
  var nodesExplored = [source.data]
  visited[source] = true
  
  while let node = queue.dequeue() {
    for edge in graph.edgesFrom(node) {
      let neighborNode = edge.to
      if !visited[neighborNode, default: false] {
        queue.enqueue(neighborNode)
        visited[neighborNode] = true
        nodesExplored.append(neighborNode.data)
      }
    }
  }
  
  return nodesExplored
}

func testBFSWithListGraph() {
  let graph = AdjacencyListGraph<String>()

  let a = graph.createVertex("a")
  let b = graph.createVertex("b")
  let c = graph.createVertex("c")
  let d = graph.createVertex("d")
  let e = graph.createVertex("e")
  let f = graph.createVertex("f")
  let g = graph.createVertex("g")
  let h = graph.createVertex("h")

  graph.addUndirectedEdge((a, b), withWeight: nil)
  graph.addUndirectedEdge((a, c), withWeight: nil)
  graph.addUndirectedEdge((b, d), withWeight: nil)
  graph.addUndirectedEdge((b, e), withWeight: nil)
  graph.addUndirectedEdge((c, f), withWeight: nil)
  graph.addUndirectedEdge((c, g), withWeight: nil)
  graph.addUndirectedEdge((e, h), withWeight: nil)
  graph.addUndirectedEdge((e, f), withWeight: nil)
  graph.addUndirectedEdge((f, g), withWeight: nil)

  let nodesExplored = breadthFirstSearch(graph, source: a)
  print(nodesExplored)
}

func testBFSWithMatrixGraph() {
  let matrix = AdjacencyMatrixGraph<String>()

  let ma = matrix.createVertex("a")
  let mb = matrix.createVertex("b")
  let mc = matrix.createVertex("c")
  let md = matrix.createVertex("d")
  let me = matrix.createVertex("e")
  let mf = matrix.createVertex("f")
  let mg = matrix.createVertex("g")
  let mh = matrix.createVertex("h")

  matrix.addUndirectedEdge((ma, mb), withWeight: 1)
  matrix.addUndirectedEdge((ma, mc), withWeight: 1)
  matrix.addUndirectedEdge((mb, md), withWeight: 1)
  matrix.addUndirectedEdge((mb, me), withWeight: 1)
  matrix.addUndirectedEdge((mc, mf), withWeight: 1)
  matrix.addUndirectedEdge((mc, mg), withWeight: 1)
  matrix.addUndirectedEdge((me, mh), withWeight: 1)
  matrix.addUndirectedEdge((me, mf), withWeight: 1)
  matrix.addUndirectedEdge((mf, mg), withWeight: 1)

  let matrixNodesExplored = breadthFirstSearch(matrix, source: ma)
  print(matrixNodesExplored)

}
