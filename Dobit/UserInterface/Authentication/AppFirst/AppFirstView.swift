/// 앱을 실행하면, Splash 화면 다음으로 나타나는 View 입니다.
/// - Figma 상 "First" 라는 이름으로 작성된 View 입니다.
/// - 해당 화면에서 회원가입 이나 로그인 화면으로 이동합니다.

import UIKit

class AppFirstView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "Authentication"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
    }
    
    
    // MARK: - Actions
    @objc
    private func registerButtonDidTap() {
        // TODO: 회원가입 화면으로 이동한다.
    }
    
    @objc
    private func loginButtonDidTap() {
        // TODO: 로그인 화면으로 이동한다.
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        self.view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        
    }
}



