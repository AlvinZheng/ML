//
//  Reader.swift
//  Gradient Desend
//
//  Created by alvin zheng on 30/10/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation



class Reader {

}

/*
 input formate:
 1,2,3:400.0;
 1,2,3:500.0;
 1,2,3:600.0
 this is based on the input data format
 */
class HousePriceReader {

    // house price parse
    class func readFromFile(url: String) -> HousePricePresentation? {
        guard let source = readFromeFile(url: url) else { return nil }
        let samples = source.map { (s) -> HousePriceSample in
            let ins = s.0
            let outs = s.1
            let oneInput = HousePriceInput(area: Int(ins[0]),
                                           rooms: Int(ins[1]),
                                           trafic: Float(ins[2]))
            let oneOutput = HousePriceOutput(outs[0])
            let oneSample = HousePriceSample(oneInput, oneOutput)
            return oneSample
        }

        return HousePricePresentation(samples: samples)
    }
    
    // normal parse
    class func readFromeFile(url: String) -> [([Float], [Float])]? {
        guard let string = try? String(contentsOfFile: url) else {
            print("data file error, cannot read to file\(url)")
            return nil
        }

        let formatStr = string.trimmingCharacters(in: .whitespacesAndNewlines)
        let samples = formatStr.components(separatedBy: CharacterSet(charactersIn: ";"))
        var results = [([Float], [Float])]()
        for s in samples {
            let input_output = s.components(separatedBy: CharacterSet(charactersIn: ":"))
            guard input_output.count == 2 else {
                print("format error")
                return nil
            }
            // string has no pattern matching!! fucking.
            let input = input_output[0]
            let ins = input.components(separatedBy: CharacterSet(charactersIn: ",")).map({ (s) -> Float in
                return Float(s)!
            })
            let output = input_output[1]
            let outs = output.components(separatedBy: CharacterSet(charactersIn: ",")).map({ (s) -> Float in
                return Float(s)!
            })
            results.append((ins, outs))
        }
        return results
    }
}

