//
//  PasswordResetAuthView.swift
//  Dobit
//
//  Created by 박현우 on 2022/07/10.
//

import UIKit

class PasswordResetAuthView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "PasswordResetView_Auth"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var certNumberTextField: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var certNumberErrorLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var certNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
        
        sendButton.addTarget(self, action: #selector(sendButtonDidTap), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(previousButtonDidTap), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func sendButtonDidTap() {
        let email = emailTextField.text ?? ""
        
        AuthenticationService.passwordResetAuth(email: email) { [weak self] data in
            guard let self = self else { return }
            
            if data.isSuccess {
                if let result = data.result {
                    // TODO: 인증번호 재설정 성공 시 alert 띄우기
                }
            } else {
                // MARK: 비밀번호 재설정 인증 실패 시 에러 메시지 표시
                self.emailErrorLabel.isHidden = true
                
                switch data.code {
                case 2020, 2021, 2037, 5000:
                    self.emailErrorLabel.error(text: data.message)
                default:
                    break
                }
            }
        }
    }
    
    @objc
    private func previousButtonDidTap() {
        // MARK: 이전 화면으로 이동한다.
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func nextButtonDidTap() {
        // MARK: 비밀번호 재설정 화면으로 이동한다.
        let vc = self.storyboard?.instantiateViewController(withIdentifier: PasswordResetView.storyboardName) as! PasswordResetView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.tintColor = dobitTintColor
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        [emailTextField, certNumberTextField].forEach {
            $0?.addBottomBorder()
            $0?.textColor = dobitTintColor
        }
        
        sendButton.bold(ofSize: 14.0, weight: .bold)
        // MARK: iOS 15 이전 버전 UIButton Image 위치 설정
        if #unavailable(iOS 15.0) {
            nextButton.semanticContentAttribute = .forceRightToLeft
        }
    }
}
