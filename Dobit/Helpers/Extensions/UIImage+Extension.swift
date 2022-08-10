//
//  UIImage+Extension.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/10.
//

import UIKit

extension UIImage {
    func imageWithInsets(insets: UIEdgeInsets, color: String) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: self.size.width + insets.left + insets.right,
                       height: self.size.height + insets.top + insets.bottom), false, self.scale)
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(UIColor(named: color)!.cgColor)
            let origin = CGPoint(x: insets.left, y: insets.top)
            self.draw(at: origin)
            let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return imageWithInsets
        }
}

