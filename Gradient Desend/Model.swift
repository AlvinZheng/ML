//
//  Model.swift
//  Gradient Desend
//
//  Created by alvin zheng on 31/10/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation
/*
 model is the result of our leaning.
 all we do is training a model,to predict new values.
 */

protocol Model {
    associatedtype Input
    associatedtype Output
    var decisionFunction: (Input) -> Output { get }
    func predict(input: Input) -> Output
}
/*
 default implement of predict method
 */
extension Model {
    func predict(input: Input) -> Output {
        return self.decisionFunction(input)
    }
}

/*
 house price predict model
 */
class HousePriceModel: Model {
    typealias Input = HousePriceInput
    typealias Output = HousePriceOutput

    var decisionFunction: (HousePriceInput) -> HousePriceOutput

    init(decision: @escaping (HousePriceInput) -> HousePriceOutput) {
        self.decisionFunction = decision
    }
}

//模型函数
class Hypothesis {
    var thetas = [Float]()
    var demension: Int

    func caculate(input: [Float]) -> Float {
        guard input.count == demension else {
            fatalError("input demension not match the hypothesis")
        }
        return 0
    }

    init(demension: Int) {
        self.demension = demension
        thetas = [Float].init(repeating: 0.0, count: self.demension)
    }
}



