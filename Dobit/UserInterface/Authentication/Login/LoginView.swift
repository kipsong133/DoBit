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
    @objc
    private func previousButtonDidTap() {
        // TODO: 이전 화면으로 이동한다.
    }
    
    @objc
    private func startButtonDidTap() {
        // TODO: 메인 화면으로 이동한다.
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        [emailTextField, passwordTextField].forEach {
            $0?.addBottomBorder()
        }
    }
}
