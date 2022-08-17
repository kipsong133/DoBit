//
//  PasswordResetView.swift
//  Dobit
//
//  Created by 박현우 on 2022/07/10.
//

import UIKit

class PasswordResetView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "PasswordResetView"
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var passwordCheckErrorLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
        
        previousButton.addTarget(self, action: #selector(previousButtonDidTap), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func previousButtonDidTap() {
        // MARK: 이전 화면으로 이동한다.
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func nextButtonDidTap() {
        let email = "gusdn5387@naver.com"
        let pw = passwordTextField.text ?? ""
        let pwConfirm = passwordCheckTextField.text ?? ""
        
        AuthenticationService.passwordReset(email: email, pw: pw, pwConfirm: pwConfirm) { [weak self] data in
            guard let self = self else { return }
            
            if data.isSuccess {
                // MARK: 로그인 화면으로 이동한다.
                let vc = self.storyboard?.instantiateViewController(withIdentifier: LoginView.storyboardName) as! LoginView
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // MARK: 비밀번호 재설정 실패 시 에러 메시지 표시
                [self.passwordErrorLabel, self.passwordCheckErrorLabel].forEach {
                    $0?.isHidden = true
                }
                
                switch data.code {
                case 2030, 2035:
                    self.passwordErrorLabel.error(text: data.message)
                case 2031, 2033, 3010:
                    self.passwordCheckErrorLabel.error(text: data.message)
                default:
                    break
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.tintColor = dobitTintColor
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        [passwordTextField, passwordCheckTextField].forEach {
            $0?.addBottomBorder()
            $0?.textColor = dobitTintColor
        }
        
        // MARK: iOS 15 이전 버전 UIButton Image 위치 설정
        if #unavailable(iOS 15.0) {
            nextButton.semanticContentAttribute = .forceRightToLeft
        }
    }
}
