//
//  Vertex.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/05.
//

import Foundation

struct Vertex<T>: Equatable where T: Hashable {
  var data: T
  let index: Int
}

extension Vertex: CustomStringConvertible {
  var description: String {
    return "\(index): \(data)"
  }
}

extension Vertex: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(data)
    hasher.combine(index)
  }
}

func ==<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
  guard lhs.index == rhs.index else { return false }
  guard lhs.data == rhs.data else { return false }
  
  return true
}
