//
//  DataPresentation.swift
//  Gradient Desend
//
//  Created by alvin zheng on 30/10/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation

protocol SamplePresentation {
    associatedtype InputType
    associatedtype OutputType
    typealias S = (InputType, OutputType)
    var samples: [S] { get }
}

/*
 normaly we user this formate to present sample
 only input float and out put float,
 todo: adapt other types
 */
typealias Sample = ([Float], Float)



/*
 this is an example of Sample,
 use an turple for inputs,
 and use an turple for sample.
 */

/*
 house price input
 */
typealias HousePriceInput = (area: Int, rooms: Int, trafic: Float)
/*
 house price is Float
 */
typealias HousePriceOutput = Float

/*
 one house price sample
 */
typealias HousePriceSample = (HousePriceInput, HousePriceOutput)

/*
 sample presentation
 */
class HousePricePresentation: SamplePresentation {
    typealias InputType = HousePriceInput
    typealias OutputType = HousePriceOutput
    typealias S = (InputType, OutputType)

    var samples: [S] //= [((area: 120, rooms: 3, trafic: 0.8), 120),
                          //   ((area: 120, rooms: 3, trafic: 0.8), 120)]

    init(samples: [S]) {
        self.samples = samples
    }

//    func normalize(normalizer: FloatNormaliser) -> [S] {
//        
//    }
}

