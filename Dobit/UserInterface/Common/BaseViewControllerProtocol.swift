/// Dobit ViewController 의 공통 속성을 정의하는 곳 입니다.
/// - 구현은 이곳에서 하되, 적용은 각각의 ViewController 가 제어합니다.
/// (어떤 화면에서는 공통적으로 사용하는 백그라운드 색상일 수 있으나, 상황에 따라서 아닌 경우가 있을 수 있으므로)

import UIKit

protocol BaseViewControllerProtocol: UIViewController {
    var dobitBackgroundColor: UIColor { get }
    var sidePadding: CGFloat { get }
}

extension BaseViewControllerProtocol {
    var dobitBackgroundColor: UIColor {
        return UIColor.white
    }
    
    var sidePadding: CGFloat { return 22 }
}

