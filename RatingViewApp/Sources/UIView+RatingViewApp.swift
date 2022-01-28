//
//  UIView+RatingViewApp.swift
//  RatingViewApp
//
//  Created by Silvia Kuzmova on 28.01.22.
//

import UIKit

extension UIView {
    func removeAllSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}
