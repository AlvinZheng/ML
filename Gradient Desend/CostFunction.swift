//
//  CostFunction.swift
//  Gradient Desend
//
//  Created by alvin zheng on 30/10/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation

//cost function , to caculate loss between predicted value and actual value
protocol CostFunction {
    func caculate(predict: Float, actual: Float) -> Float
}

class ZeroOneLossFunction: CostFunction {
    func caculate(predict: Float, actual: Float) -> Float {
        if predict == actual { return 1.0 }
        return 0.0
    }
}

class QuadraticLossFunction: CostFunction {
    func caculate(predict: Float, actual: Float) -> Float {
        return (actual - predict) * (actual - predict)
    }
}

class AbsoluteLossFunction: CostFunction {
    func caculate(predict: Float, actual: Float) -> Float {
        return abs(actual - predict)
    }
}

// log-likehood loss function
// TODO
class LoglikehoodLossFunction: CostFunction {
    func caculate(predict: Float, actual: Float) -> Float {
        return 0.0
    }
}

protocol Func {

}

