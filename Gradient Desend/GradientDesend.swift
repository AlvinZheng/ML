//
//  GradientDesend.swift
//  Gradient Desend
//
//  Created by alvin zheng on 17/10/16.
//  Copyright © 2017年 alvin. All rights reserved.
//

import Foundation


/*
 the update rule of gradient descend
 */
enum GradientUpdateRule {
    // update = learningRate * gradient_of_parameters
    // parameters = parameters - update
    // this pure gradient descend
    case vanilla
    // update = learningRate * greadient
    // velocity = previousUpdate * momentum
    // param = param + velocity - update
    case momentum
    // adaptive change learning rate, on the base of all the previous iterations of learning rate
    // grad_component = prevoids_grad_component + (gradient * gradient)
    // rateChange = square_root(grad_component) + epsilon
    // adapted_learning_rate = learningRate  * rateChange
    // update = adapted_learning_rate * gradient
    // parameter = parameter - update
    case adaptive

    // momentum + adaptive
    case adaptiveMomentum
}

//class GradientDescend {
//    var updateRule: GradientUpdateRule = . vanilla
//
//    // update function
//    private func gradientDescend(cost: Float, params:[Float], learningRate: Float = 0.05) {
//
//    }
//    // caculate the gradient
//    private func gradient() -> [Float] {
//
//        return []
//    }
//
//}

