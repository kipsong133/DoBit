//
//  UIView+Extension.swift
//  Dobit
//
//  Created by 김우성 on 2022/07/09.
//

import UIKit

// CornerRadius 스토리보드에서 적용하기
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
