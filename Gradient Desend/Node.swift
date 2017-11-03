//
//  Node.swift
//  Gradient Desend
//
//  Created by alvin zheng on 31/10/2017.
//  Copyright © 2017 alvin. All rights reserved.
//

import Foundation
class Node {
    let v = 1.0
    var next: Node? = nil
}

let list = Node()

func reverse(list: Node) -> Node {
    let first = list
    let second = first.next
    first.next = nil
    var tmp = second?.next
    second?.next = first
    var reversed = second
    while let rest = tmp?.next {
        tmp?.next = reversed
        reversed = tmp
        tmp = rest
    }
    return reversed!
}

func reverseNice(list: Node) -> Node {
    let second = list.next
    let first = list
    first.next = nil
    guard second != nil else { return
        first
    }
    var (reversed, rest) = reverseOne(reversed: first, rest: second!)
    while rest != nil {
        (reversed, rest) = reverseOne(reversed: reversed, rest: rest!)
    }
    return reversed
}

func reverseOne(reversed: Node, rest: Node)-> (reversed: Node, rest: Node?) {
    let tmp = rest.next
    let retrunNext = rest
    retrunNext.next = reversed
    return (retrunNext, tmp)
}
