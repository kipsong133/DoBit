//
//  UIButton+Extension.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/11.
//

import UIKit

extension UIButton {
    // MARK: UIButton 굵게 처리
    func bold(ofSize: CGFloat, weight: UIFont.Weight) -> UIButton {
        if #available(iOS 15.0, *) {
            self.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = .systemFont(ofSize: 16, weight: .bold)
                return outgoing
            }
        } else {
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        }
        
        return self
    }
}
