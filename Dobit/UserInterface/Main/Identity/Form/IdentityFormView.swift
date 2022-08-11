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
    
    @IBOutlet weak var defineTextField: UITextField!
    @IBOutlet var colorImageView: [UIImageView]!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var selected: UIImageView? {
        didSet {
            if selected != nil {
                oldValue?.isHighlighted = false
                oldValue?.layer.borderWidth = 0
            }
        }
    }
    var colors: [String] = [
        "DoBit Beige",
        "DoBit Pink",
        "DoBit Red",
        "DoBit Yellow",
        "DoBit Green",
        "DoBit Skyblue",
        "DoBit Blue",
        "DoBit Purple",
        "DoBit Black"
    ]
    
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
    
    // MARK: 색상 선택했을 때
    @objc func colorImageViewDidTap(_ sender: UITapGestureRecognizer) {
        let selectedView = colorImageView[sender.view!.tag]
        updateImageView(selectedView)
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupView() {
        [backButton, submitButton].forEach {
            $0.setTitle("", for: .normal)
        }
        
        defineTextField.delegate = self
        
        colorImageView.forEach { imageView in
            let tap = UITapGestureRecognizer(target: self, action: #selector(colorImageViewDidTap(_:)))
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
            
            imageView.image = UIImage(named: "capsule.template")?.imageWithInsets(insets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3), color: colors[imageView.tag])
            imageView.sizeToFit()
        }
        
        // MARK: UIButton 굵게 처리
        if #available(iOS 15.0, *) {
            deleteButton.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = .systemFont(ofSize: 16, weight: .bold)
                return outgoing
            }
        } else {
            deleteButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }
    
    // MARK: 색상 선택 시 선택한 색상 강조
    private func updateImageView(_ imageView: UIImageView?) {
        guard let imageView = imageView else { return }

        imageView.isHighlighted.toggle()
        
        if imageView.isHighlighted {
            selected = imageView
            
            imageView.layer.borderColor = dobitTintColor.cgColor
            imageView.layer.borderWidth = 1
            imageView.layer.cornerRadius = imageView.frame.width / 2
        } else {
            selected = nil
            
            imageView.layer.borderWidth = 0
        }
    }
}

// MARK: - UITextFieldDelegate
// 사용하는 textField에 delegate 설정 필요
extension IdentityFormView: UITextFieldDelegate {
    // 화면 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // return 키 눌렀을 경우 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
