//
//  RegisterView.swift
//  Dobit
//
//  Created by 김우성 on 2022/07/09.
//

import UIKit

class RegisterView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "RegisterView"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var passwordCheckErrorLabel: UILabel!
    @IBOutlet weak var nicknameErrorLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
        
        previousButton.addTarget(self, action: #selector(previousButtonDidTap), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func previousButtonDidTap() {
        // MARK: 첫 화면으로 이동한다.
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func startButtonDidTap() {
        let email = emailTextField.text ?? ""
        let pw = passwordTextField.text ?? ""
        let pwConfirm = passwordCheckTextField.text ?? ""
        let nickname = nicknameTextField.text ?? ""
        
        AuthenticationService.register(email: email, pw: pw, pwConfirm: pwConfirm, nickname: nickname) { [weak self] data in
            guard let self = self else { return }
            
            if data.isSuccess {
                // MARK: 로그인 화면으로 이동한다.
                let vc = self.storyboard?.instantiateViewController(withIdentifier: LoginView.storyboardName) as! LoginView
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // MARK: 회원가입 실패 시 에러 메시지 표시
                [self.emailErrorLabel, self.passwordErrorLabel, self.passwordCheckErrorLabel, self.nicknameErrorLabel].forEach {
                    $0?.isHidden = true
                }
                
                switch data.code {
                case 2020, 2021, 2036:
                    self.emailErrorLabel.error(text: data.message)
                case 2030, 2035:
                    self.passwordErrorLabel.error(text: data.message)
                case 2031, 2033:
                    self.passwordCheckErrorLabel.error(text: data.message)
                case 2034, 3011:
                    self.nicknameErrorLabel.error(text: data.message)
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
        [emailTextField, passwordTextField, passwordCheckTextField, nicknameTextField].forEach {
            $0?.addBottomBorder()
            $0?.textColor = dobitTintColor
        }
        
        // MARK: iOS 15 이전 버전 UIButton Image 위치 설정
        if #unavailable(iOS 15.0) {
            startButton.semanticContentAttribute = .forceRightToLeft
        }
    }
}
