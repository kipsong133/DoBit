//
//  IdentityView.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/05.
//

import UIKit

class IdentityView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "IdentityView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
}
