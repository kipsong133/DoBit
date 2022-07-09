//
//  Storyboardable.swift
//  Dobit
//
//  Created by 김우성 on 2022/07/09.
//

import UIKit

protocol Storyboardable {

    // MARK: - Properties

    static var storyboardName: String { get set }
    static var storyboardBundle: Bundle { get }

    // MARK: -

    static var storyboardIdentifier: String { get }

    // MARK: - Methods

    static func instantiate() -> Self

}

extension Storyboardable where Self: UIViewController {

    // MARK: - Properties

    static var storyboardName: String {
        return "Main"
    }

    static var storyboardBundle: Bundle {
        return .main
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Methods

    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }

        return viewController
    }
}

class TestViewController: UIViewController, Storyboardable {
    static var storyboardName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = TestViewController.instantiate()
        self.present(vc, animated: true)
    }
    
}

class TestViewController02: UIViewController, Storyboardable {
    static var storyboardName: String = ""
    
}
