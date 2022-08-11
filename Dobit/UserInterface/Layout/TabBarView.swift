//
//  TabBarView.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/04.
//

import UIKit

class TabBarView: UITabBarController {
    static let identifier = "TabBarView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        tabBar.barTintColor = UIColor(named: "DoBit Grey")
        view.tintColor = UIColor(named: "DoBit Black")
    }
}
