//
//  MLFeatureProviderHelper.swift
//  CameraBase
//
//  Created by Al on 09/09/2022.
//

import CoreML

extension MLMultiArray {
    
    func flattenToDouble() -> [Double] {
        if let b = try? UnsafeBufferPointer<Float>(self) {
          let c = Array(b)
            return c.map{ Double($0) }
        }
        return []
    }
    
    func flattenToFloat() -> [Float] {
        if let b = try? UnsafeBufferPointer<Float>(self) {
          let c = Array(b)
           return c
        }
        return []
    }
    
}
