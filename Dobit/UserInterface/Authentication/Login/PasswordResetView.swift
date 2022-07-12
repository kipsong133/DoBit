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
        // TODO: 이전 화면으로 이동한다.
    }
    
    @objc
    private func nextButtonDidTap() {
        // TODO: 로그인 화면으로 이동한다.
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        [passwordTextField, passwordCheckTextField].forEach {
            $0?.addBottomBorder()
        }
    }
}
