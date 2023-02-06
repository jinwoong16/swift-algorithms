//
//  Stack.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/06.
//

import Foundation

struct Stack<T> where T: Equatable {
  private var array = [T]()
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var count: Int {
    return array.count
  }
  
  mutating func push(_ element: T) {
    if !array.contains(element) {
      array.append(element)
    }
  }
  
  mutating func pop() -> T? {
    return array.popLast()
  }
}
