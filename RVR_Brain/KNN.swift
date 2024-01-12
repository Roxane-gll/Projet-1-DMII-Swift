//
//  KNN.swift
//  CameraBase
//
//  Created by Al on 09/09/2022.
//

import Foundation
import Darwin

public class KNearestNeighborsClassifier {
  
  var data:           [[Float]]
  var labels:         [Int]
  var nNeighbors:     Int
  
  public init(data: [[Float]], labels: [Int], nNeighbors: Int = 3) {
    self.data = data
    self.labels = labels
    self.nNeighbors = nNeighbors
    
    guard nNeighbors <= data.count else {
      fatalError("Expected `nNeighbors` (\(nNeighbors)) <= `data.count` (\(data.count))")
    }
    
    guard data.count == labels.count else {
      fatalError("Expected `data.count` (\(data.count)) == `labels.count` (\(labels.count))")
    }
  }
  
  public func predict(_ xTests: [[Float]]) -> [Int] {
    return xTests.map({
      let knn = kNearestNeighbors($0)
      return kNearestNeighborsMajority(knn)
    })
  }
  
  private func distance(_ xTrain: [Float], _ xTest: [Float]) -> Float {
    let distances = xTrain.enumerated().map { index, _ in
      return pow(xTrain[index] - xTest[index], 2)
    }
    
    return distances.reduce(0, +)
  }
  
  private func kNearestNeighbors(_ xTest: [Float]) -> [(key: Float, value: Int)] {
    var NearestNeighbors = [Float : Int]()
    
    for (index, xTrain) in data.enumerated() {
      NearestNeighbors[distance(xTrain, xTest)] = labels[index]
    }
    
    let kNearestNeighborsSorted = Array(NearestNeighbors.sorted(by: { $0.0 < $1.0 }))[0...nNeighbors-1]
    
    return Array(kNearestNeighborsSorted)
  }
  
  private func kNearestNeighborsMajority(_ knn: [(key: Float, value: Int)]) -> Int {
    var labels = [Int :  Int]()
    
    for neighbor in knn {
      labels[neighbor.value] = (labels[neighbor.value] ?? 0) + 1
    }
    
    for label in labels {
      if label.value == labels.values.max() {
        return label.key
      }
    }
    
    fatalError("Cannot find the majority.")
  }
}
