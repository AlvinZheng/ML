//
//  Normalization.swift
//  Gradient Desend
//
//  Created by alvin zheng on 30/10/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation

enum NormalizaitonMethod {
    //z-score normalization
    case zscore
    //max-min normalization
    case maxmin
}

protocol Normaliser {
    associatedtype T
    var type: NormalizaitonMethod { get }
    func normalize(datas: [T]) -> [Float]
    func denormalize(value: [Float]) -> [T]
}

class FloatNormaliser: Normaliser {
    typealias T = Float
    var type: NormalizaitonMethod

    init(type: NormalizaitonMethod) {
        self.type = type
    }

    func normalize(datas: [Float]) -> [Float] {
        switch type {
        case .zscore:
            let total = datas.reduce(0, +)
            // mean value
            let u = total / Float(datas.count)
            //variance
            let v = datas.reduce(0, { (r, n) -> Float in
                return r + (n - u) * (n - u)
            })
            //standard deviation
            let σ = sqrtf(v)
            let results = datas.map({ (d) -> Float in
                let r = (d - u)/σ
                return r
            })
            return results
        case .maxmin:
            // get the max,min value
            let max_min: (Float, Float) = datas.reduce((datas[0], datas[0]), { (arg0, next) -> (Float, Float) in
                let (max, min) = arg0
                let newMax = max > next ? max : next
                let newMin = min < next ? min : next
                return (newMax, newMin)
            })
            let max = max_min.0
            let min = max_min.1
            let scope = max - min

            let results = datas.map({ (d) -> T in
                return (d - min) / scope
            })
            return results
        }
    }

    // do not surport denormalize temporary
    func denormalize(value: [Float]) -> [Float] {
        return value
    }
}

