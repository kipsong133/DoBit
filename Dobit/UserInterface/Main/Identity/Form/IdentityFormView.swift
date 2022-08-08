//
//  IdentityFormView.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/08.
//

import UIKit

class IdentityFormView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "IdentityFormView"
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupView()
    }
    
    // MARK: - Actions
    
    // MARK: 뒤로 가기 버튼 눌렀을 때
    @IBAction func backButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: 등록 버튼 눌렀을 때
    @IBAction func submitButtonDidTap(_ sender: Any) {
        
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupView() {
        [backButton, submitButton].forEach {
            $0.setTitle("", for: .normal)
        }
    }
    
    // TODO: 색상 선택 시 강조하기
}
