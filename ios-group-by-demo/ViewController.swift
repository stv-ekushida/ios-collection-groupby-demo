//
//  ViewController.swift
//  ios-group-by-demo
//
//  Created by Eiji Kushida on 2017/06/20.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let days = [
        "2017/10/10 10:10:10",
        "2017/10/10 10:10:10",
        "2017/10/09 10:10:10",
        "2017/10/09 10:10:10",
        "2017/10/10 10:10:10",
        "2017/10/08 10:10:10",
        "2017/10/08 10:10:10",
        "2017/10/10 10:10:10",
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        //使い方
        let result = days.groupBy {

            //グルーピングするキー
            $0.components(separatedBy: " ").first!
        }

        _ = result.map {
            print($0.key)
        }
    }
}


//Group byするExtension
extension Sequence {

    func groupBy<G: Hashable>(closure: (Iterator.Element)->G) -> [G: [Iterator.Element]] {
        var results = [G: Array<Iterator.Element>]()

        forEach {
            let key = closure($0)

            if var array = results[key] {
                array.append($0)
                results[key] = array
            }
            else {
                results[key] = [$0]
            }
        }
        
        return results
    }
}

