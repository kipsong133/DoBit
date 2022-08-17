//
//  LoginView.swift
//  Dobit
//
//  Created by 박현우 on 2022/07/10.
//

import UIKit

class LoginView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "LoginView"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var passwordResetButton: UIButton!
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
    @IBAction func passwordResetButtonDidTap(_ sender: Any) {
        // MARK: 비밀번호 재설정을 위한 인증 화면으로 이동한다.
        let vc = storyboard?.instantiateViewController(withIdentifier: PasswordResetAuthView.storyboardName) as! PasswordResetAuthView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func previousButtonDidTap() {
        // MARK: 이전 화면으로 이동한다.
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func startButtonDidTap() {
        let email = emailTextField.text ?? ""
        let pw = passwordTextField.text ?? ""
        
        AuthenticationService.login(email: email, pw: pw) { [weak self] data in
            guard let self = self, let result = data.result else { return }
            
            if data.isSuccess {
                // MARK: 앱에 로그인 정보 저장
                let userdefaults = UserDefaults.standard
                userdefaults.set(result.userIdx, forKey: "userIdx")
                userdefaults.set(result.nickname, forKey: "nickname")
                userdefaults.set(result.jwt, forKey: "jwt")
                
                // MARK: 메인 화면으로 이동한다.
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let vc =  storyboard.instantiateViewController(withIdentifier: TabBarView.identifier) as! TabBarView
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
                sceneDelegate.window?.rootViewController = vc
            } else {
                // MARK: 로그인 실패 시 에러 메시지 표시
                [self.emailErrorLabel, self.passwordErrorLabel].forEach {
                    $0?.isHidden = true
                }
                
                switch data.code {
                case 2020, 2021, 2073:
                    self.emailErrorLabel.error(text: data.message)
                case 2030, 2032, 2074, 3010:
                    self.passwordErrorLabel.error(text: data.message)
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
        [emailTextField, passwordTextField].forEach {
            $0?.addBottomBorder()
            $0?.textColor = dobitTintColor
        }
        
        passwordResetButton.bold(ofSize: 14.0, weight: .bold)
        
        // MARK: iOS 15 이전 버전 UIButton Image 위치 설정
        if #unavailable(iOS 15.0) {
            startButton.semanticContentAttribute = .forceRightToLeft
        }
    }
}
