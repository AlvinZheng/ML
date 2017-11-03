//
//  Algorithm.swift
//  Gradient Desend
//
//  Created by alvin zheng on 02/11/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation

protocol Algorithm {
    func caculate() -> Hypothesis
}


//只实现线性回归模型J()的梯度下降
//class GradientDescend: Algorithm {
//    var originFunc: EmpiricalRisk
//
//    var step: Float = 1.0
//    var stop: Float = 0.1
//    func gradient() -> Float {
//        
//    }
//    var samples: [Sample] = [Sample]()
//    func caculate() -> Hypothesis {
//        // initial thetas
//
//        var thetas = [Float].init(repeating: 0.0, count: originFunc.hypothesis.demension)
//        var max = 10000
//        var stoped = false
//        while max > 0 && !stoped {
//            originFunc.hypothesis.thetas = thetas
//            for i in 0...thetas.count {
//                let gradient = originFunc.gradientAt(i: i, samples: samples)
//                if abs(gradient) < stop {
//                    stoped = true
//                    break
//                }
//                thetas[i] -= step * gradient
//            }
//            max -= 1
//        }
//         originFunc.hypothesis.thetas = thetas
//        return originFunc.hypothesis
//        
//    }
//}


