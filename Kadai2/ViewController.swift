//
//  ViewController.swift
//  Kadai2
//
//  Created by 田岸将勝 on 2022/02/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var label: UILabel!

    @IBAction private func pressButton(_ sender: UIButton) {
        let calculate = Calculator()
        let value1 = firstTextField.textToDouble ?? 0
        let value2 = secondTextField.textToDouble ?? 0
        let index = segmentedControl.selectedSegmentIndex

        let resultText: String
        switch index {
        case 0:
            resultText = String(calculate.add(value1: value1, value2: value2))
        case 1:
            resultText = String(calculate.subtract(value1: value1, value2: value2))
        case 2:
            resultText = String(calculate.multiply(value1: value1, value2: value2))
        case 3:
            if value2 == 0 {
                resultText = "割る数には0以外を入力してください。"
            } else {
                resultText = String(calculate.divide(value1: value1, value2: value2))
            }
        default:
            fatalError("indexが異常です")
        }
        label.text = resultText
    }
}

struct Calculator {
    func add(value1: Double, value2: Double) -> Double {
        value1 + value2
    }

    func subtract(value1: Double, value2: Double) -> Double {
        value1 - value2
    }

    func multiply(value1: Double, value2: Double) -> Double {
        value1 * value2
    }

    func divide(value1: Double, value2: Double) -> Double {
        value1 / value2
    }
}

extension UITextField {
    var textToDouble: Double? {
        let text = self.text
        let double = text.flatMap { Double($0) }
        return double
    }
}
