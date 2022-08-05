//
//  HabitView.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/05.
//

import UIKit

class HabitView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "HabitView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
}
