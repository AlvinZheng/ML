//
//  Strategy.swift
//  Gradient Desend
//
//  Created by alvin zheng on 31/10/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation
//the strategy to evaluate hypothesis function
// 策略， 用来挑选合适的模型。
class Strategy {
    func evaluate() -> Hypothesis {
        fatalError("subclass should override this method")
    }
}

// ERM, empirical risk minimization
//经验风险最小化
class MinEmpiricalRisk: Strategy {
    var r_emp: EmpiricalRisk
    override func evaluate() -> Hypothesis {
        //TODO, choose an appropriate model
        return r_emp.hypothesis
    }

    init(emp: EmpiricalRisk) {
        self.r_emp = emp
    }
}

// SRM, structural risk minimization
//结构风险最小化
//class MinStructuralRisk: Strategy {
//    var originHypothesis: Hypothesis
//    override func evaluate() -> Hypothesis {
//        //TODO, choose an appropriate model
//        return originHypothesis
//    }
//
//    init(hypothesis: Hypothesis) {
//        self.originHypothesis = hypothesis
//    }
//}


//
/*
 caculate the empirical risk of all smaple
 经验风险, 即数据集的平均损失，详情见《统计学习方法》李航 著 8页
 */
class EmpiricalRisk {
    // cost function caculate one sample loss
    // 评估一个样本的损失
    var costFunc: CostFunction = QuadraticLossFunction()

    //所需要的模型
    var hypothesis: Hypothesis

    init(costFunction: CostFunction, hypothesis: Hypothesis) {
        self.costFunc = costFunction
        self.hypothesis = hypothesis
    }

    // caculate the empirical risk
    // 计算样本的经验风险 R_emp = 1/N *Sum(1-N){ Cost }
    func caculate(samples: [Sample]) -> Float {
        let N = samples.count //样本数
        let totalLoss = samples.reduce(0.0) { (r, n) -> Float in
            let predict = hypothesis.caculate(input: n.0)// get the predicted value
            let actual = n.1
            let nextLoss = costFunc.caculate(predict: predict, actual: actual)
            return r + nextLoss
        }
        let r_emp = totalLoss / Float(N)//数据集的平均损失，即经验风险
        return r_emp
    }

    //theta_i 在样本sample的梯度,
    func gradientAt(i: Int, samples: [Sample] ) -> Float {
//        let h = hypothesis.caculate(input: sample.0)
        let gradient = samples.reduce(0.0) { (r, n) -> Float in
            let predict = hypothesis.caculate(input: n.0)// get the predicted value
            let actual = n.1
            return (r + (predict - actual) * n.0[i]) / Float(samples.count)
        }
        return gradient
    }
}

typealias R_emp = EmpiricalRisk



