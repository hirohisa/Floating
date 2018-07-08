//
//  ViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 4/30/18.
//  Copyright © 2018 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import Floating

class ViewController: UIViewController {

    @IBOutlet var popupButton: UIButton!

    @IBAction func didTapPopupButton(_ sender: UIButton) {
        let textField = makeUITextField(with: sender.titleLabel?.text ?? "")
        let floatingView = FloatingView(textField)
        floatingView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        floatingView.handler = { (state, object) in
            switch state {
            case .willPresent:
                self.popupButton.isHidden = true
            case .didPresent:
                object.becomeFirstResponder()
            case .willDismiss:
                object.resignFirstResponder()
                self.popupButton.titleLabel?.text = object.text
            case .didDismiss:
                self.popupButton.isHidden = false
            }
        }
        floatingView.present(from: sender.frame)
    }

    func makeUITextField(with text: String) -> UITextField {
        let field = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 60)))
        field.text = text
        return field
    }
}

