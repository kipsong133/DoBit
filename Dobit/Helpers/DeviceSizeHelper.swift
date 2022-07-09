//
//  DeviceSizeHelper.swift
//  Dobit
//
//  Created by 김우성 on 2022/07/09.
//

import UIKit

var heightFactor: CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let zeplinHeight = CGFloat(812)
    return CGFloat((screenHeight) / zeplinHeight)
}

var widthFactor: CGFloat {
    let screenHeight = UIScreen.main.bounds.width
    let zeplinHeight = CGFloat(375)
    return CGFloat((screenHeight) / zeplinHeight)
}

//MARK: - 기기 사이즈에 맞춰 오토레이아웃 코드로 잡는 함수
func autoLayoutHeight(_ height: CGFloat) -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    
    let zeplinHeight = CGFloat(812)
    /* 의미는 없지만, 추후에 참고용으로 Switch 문 작성 */
    switch screenHeight {
    case 926: // 13 ProMax, 12 ProMax
        return CGFloat((height * screenHeight) / zeplinHeight)
    case 896: // 11 ProMax, 11, Xs Max, Xr
        return CGFloat((height * screenHeight) / zeplinHeight)
    case 844: // 13 Pro, 13, 12 Pro, 12
        return CGFloat((height * screenHeight) / zeplinHeight)
    case 812: // 13 mini, 12 mini, 11 Pro, Xs, X
        return CGFloat((height * screenHeight) / zeplinHeight)
    case 736: // 8 Plus
        return CGFloat((height * screenHeight) / zeplinHeight)
    case 667: // 8
        return CGFloat((height * screenHeight) / zeplinHeight)
    default:
        return CGFloat((height * screenHeight) / zeplinHeight)
    }
}

func autoLayoutWidth(_ width: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    
    let zeplinWidth = CGFloat(375)
    /* 의미는 없지만, 추후에 참고용으로 Switch 문 작성 */
    switch screenWidth {
    case 428: // 13 ProMax, 12 ProMax
        return CGFloat((width * screenWidth) / zeplinWidth)
    case 414: // 11 ProMax, 11, Xs Max, Xr, 8 Plus
        return CGFloat((width * screenWidth) / zeplinWidth)
    case 390: // 13 Pro, 13, 12 Pro, 12
        return CGFloat((width * screenWidth) / zeplinWidth)
    case 375: // 13 mini, 12 mini, 11 Pro, Xs, X, 8
        return CGFloat((width * screenWidth) / zeplinWidth)
        
    default:
        return CGFloat((width * screenWidth) / zeplinWidth)
    }
}
