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
        let calculate = Calculate()
        let value1 = firstTextField.textToDouble ?? 0
        let value2 = secondTextField.textToDouble ?? 0
        let index = segmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            label.text = String(calculate.addition(value1: value1, value2: value2))
        case 1:
            label.text = String(calculate.subtract(value1: value1, value2: value2))
        case 2:
            label.text = String(calculate.multiply(value1: value1, value2: value2))
        case 3:
            if value2 == 0 {
                label.text = "割る数には0以外を入力してください。"
            } else {
                label.text = String(calculate.divide(value1: value1, value2: value2))
            }
        default:
            label.text = "0"
        }
    }
}

struct Calculate {
    func addition(value1: Double, value2: Double) -> Double {
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
