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
        // MARK: 로그인 화면으로 이동한다.
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        [emailTextField, passwordTextField, passwordCheckTextField, nicknameTextField].forEach {
            $0?.addBottomBorder()
        }
    }
}
