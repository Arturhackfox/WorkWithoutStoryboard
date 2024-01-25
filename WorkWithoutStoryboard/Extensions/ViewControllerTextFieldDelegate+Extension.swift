//
//  ViewControllerTextFieldDelegate+Extension.swift
//  WorkWithoutStoryboard
//
//  Created by Arthur Sh on 25.01.2024.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch reason {
        case .committed:
            print(textField.text)
        }
    }
}
