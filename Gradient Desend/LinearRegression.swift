//
//  LinearRegression.swift
//  Gradient Desend
//
//  Created by alvin zheng on 03/11/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation

//用数组合成元组
//func zip(first: [Any], second: [Any]) -> [(Any, Any)]? {
//    guard first.count == second.count else {
//        return nil
//    }
//    return nil
//}

func zip(first: [Float], second: [Float]) -> [(Float, Float)]? {
    guard first.count == second.count else {
        return nil
    }
    var results = [(Float, Float)]()
    for i in 0...first.count {
        results.append((first[i], second[i]))
    }
    return results
}

//线性回归模型
class LinearHypothesis: Hypothesis {
    var bias = true

    override func caculate(input: [Float]) -> Float {
        guard input.count == demension else {
            fatalError("input demension not match the hypothesis")
        }

        let combine = zip(first: input, second: thetas)!

        let result = combine.reduce(0.0, { (r, n) -> Float in
            return r + n.0 * n.1
        })
        return result
    }

    init(demension: Int, bias: Bool = true) {
        super.init(demension: demension)
        self.demension = bias ? demension+1 : demension
        thetas = [Float].init(repeating: 0.0, count: self.demension)
    }

    override init(demension: Int) {
        super.init(demension: demension)
        self.demension = bias ? demension+1 : demension
        thetas = [Float].init(repeating: 0.0, count: self.demension)
    }
}

class LinearRegression {
    var includeBias: Bool = true
    func trainWithSample(samples: [Sample]) -> LinearHypothesis {
        // 评估函数
        var data = samples
        if includeBias {
            data = data.map({ (s) -> Sample in
                var new = s
                new.0.insert(1.0, at: 0)//.0.insert(1.0, at: 0)
                return new
            })
        }
        let demension = data[0].0.count
        let J = EmpiricalRisk(costFunction: QuadraticLossFunction(), hypothesis: LinearHypothesis(demension: demension))
        let gradientAlgorithm = LinearGradientDescend(function: J)
        let traindModel = gradientAlgorithm.caculate(samples: data)
        return traindModel as! LinearHypothesis
    }

}

class LinearGradientDescend {
    var originFunc: EmpiricalRisk

    var step: Float = 1.0// 步长
    var stop: Float = 0.1//下降距离小余此，终止

    func caculate(samples: [Sample]) -> Hypothesis {
        // initial thetas

        var thetas = [Float].init(repeating: 0.0, count: originFunc.hypothesis.demension)
        var max = 10000
        var stoped = false
        while max > 0 && !stoped {
            originFunc.hypothesis.thetas = thetas
            for i in 0...thetas.count {
                let gradient = originFunc.gradientAt(i: i, samples: samples)
                if abs(gradient) < stop {
                    stoped = true
                    break
                }
                thetas[i] -= step * gradient
            }
            max -= 1
        }
        originFunc.hypothesis.thetas = thetas
        return originFunc.hypothesis
    }
    init(function: EmpiricalRisk) {
        self.originFunc = function
    }
}
