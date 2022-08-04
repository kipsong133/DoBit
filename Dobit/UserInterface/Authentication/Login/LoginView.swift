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
        let vc = storyboard?.instantiateViewController(withIdentifier: "PasswordResetView_Auth") as! PasswordResetView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func previousButtonDidTap() {
        // MARK: 이전 화면으로 이동한다.
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func startButtonDidTap() {
        // MARK: 메인 화면으로 이동한다.
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: TabBarView.identifier) as! TabBarView
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = vc
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        [emailTextField, passwordTextField].forEach {
            $0?.addBottomBorder()
            $0?.textColor = dobitTintColor
        }
    }
}
