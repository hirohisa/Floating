//
//  FloatingView.swift
//  Floating
//
//  Created by Hirohisa Kawasaki on 4/30/18.
//  Copyright © 2018 Hirohisa Kawasaki. All rights reserved.
//

import Foundation
import UIKit

public class FloatingView<T :UIView>: UIView {

    public enum Stretch {
        case none
        case width
        case height
        case all
    }

    public typealias Handler = (State, T) -> Void
    public var handler: Handler?

    private class CoverView: UIView {
        weak var delegate: FloatingView?

        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)

            delegate?.dismiss()
        }
    }

    public var object:T {
        return contentView
    }

    private var contentView: T
    private let coverView = CoverView()

    public init(_ view: T) {
        contentView = view
        super.init(frame: CGRect.zero)
        coverView.delegate = self
        addSubview(coverView)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    public override var backgroundColor: UIColor? {
        didSet {
            guard let color = backgroundColor else { return }

            if !color.isEqual(UIColor.clear) {
                coverView.backgroundColor = color
                backgroundColor = UIColor.clear
            }
        }
    }

    public func present(from frame: CGRect, stretch: Stretch = .width) {
        guard let window = UIApplication.shared.keyWindow else { return }

        prepare(at: CGPoint(x: frame.midX, y: frame.midY), on: window)
        present(from: make(src: frame.size, dest: contentView.frame.size, stretch: stretch), on: window)
    }

    private func prepare(at center: CGPoint, on window: UIWindow) {
        frame = window.bounds
        coverView.frame = window.bounds
        contentView.center = center
        addSubview(contentView)
    }

    private func present(from size: CGSize, on window: UIWindow) {
        post(state: .willPresent)

        window.addSubview(self)
        let tempSize = contentView.frame.size
        contentView.bounds = CGRect(origin: CGPoint.zero, size: size)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.bounds = CGRect(origin: CGPoint.zero, size: tempSize)
        }) { finished in
            self.post(state: .didPresent)
        }
    }

    private func make(src: CGSize, dest: CGSize, stretch: Stretch) -> CGSize {
        switch stretch {
        case .none:
            return dest
        case .width:
            return CGSize(width: src.width, height: dest.height)
        case .height:
            return CGSize(width: dest.width, height: src.height)
        case .all:
            return src
        }
    }

    public func dismiss() {
        post(state: .willDismiss)
        let tempAlpha = alpha
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
        }) { [weak self] finished in
            self?.alpha = tempAlpha
            self?.removeFromSuperview()
            self?.post(state: .didDismiss)
        }
    }

    private func post(state: State) {
        handler?(state, object)
    }

}
