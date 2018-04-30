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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: .FloatingViewWillPresent, object: nil, queue: nil) { (notification) in
            self.popupButton.isHidden = true
        }
        NotificationCenter.default.addObserver(forName: .FloatingViewDidPresent, object: nil, queue: nil) { (notification) in
            if let floatingView = notification.object as? FloatingView<UITextField> {
                floatingView.object.becomeFirstResponder()
            }
        }
        NotificationCenter.default.addObserver(forName: .FloatingViewWillDismiss, object: nil, queue: nil) { (notification) in
            if let floatingView = notification.object as? FloatingView<UITextField> {
                floatingView.object.resignFirstResponder()
                self.popupButton.titleLabel?.text = floatingView.object.text
            }
        }
        NotificationCenter.default.addObserver(forName: .FloatingViewDidDismiss, object: nil, queue: nil) { (notification) in
            self.popupButton.isHidden = false
        }
    }

    @IBAction func didTapPopupButton(_ sender: UIButton) {
        let overlayView = FloatingView(makeUITextField(with: sender.titleLabel?.text ?? ""))
        overlayView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        overlayView.show(from: sender.frame)
    }

    func makeUITextField(with text: String) -> UITextField {
        let field = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 60)))
        field.text = text
        return field
    }
}

