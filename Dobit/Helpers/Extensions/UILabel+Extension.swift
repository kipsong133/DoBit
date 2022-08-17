//
//  UILabel+Extension.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/17.
//

import UIKit

extension UILabel {
    // MARK: 회원가입 / 로그인 / 비밀번호 재설정 에러 메시지 표시
    func error(text: String) {
        self.text = text
        self.isHidden = false
    }
}

