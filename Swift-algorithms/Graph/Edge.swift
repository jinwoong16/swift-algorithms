//
//  Edge.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/05.
//

import Foundation

struct Edge<T>: Equatable where T: Hashable {
  let from: Vertex<T>
  let to: Vertex<T>
  
  let weight: Double?
}

extension Edge: CustomStringConvertible {
  var description: String {
    guard let unwrappedWeight = weight else {
      return "\(from.description) -> \(to.description)"
    }
    return "\(from.description) -(\(unwrappedWeight))-> \(to.description)"
  }
}

extension Edge: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(from)
    hasher.combine(to)
    if weight != nil {
      hasher.combine(weight)
    }
  }
}

func ==<T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
  guard lhs.from == rhs.from else { return false }
  guard lhs.to == rhs.to else { return false }
  guard lhs.weight == rhs.weight else { return false }
  return true
}
