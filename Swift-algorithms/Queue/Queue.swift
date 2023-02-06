//
//  Queue.swift
//  Swift-algorithms
//
//  Created by jinwoong Kim on 2023/02/05.
//

import Foundation

struct Queue<T> {
  private var array = [T?]()
  private var head = 0
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var count: Int {
    return array.count
  }
  
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }
    
    array[head] = nil
    head += 1
    
    let percentage = Double(head) / Double(array.count)
    
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
  
  var front: T? {
    return isEmpty ? nil : array[head]
  }
}
