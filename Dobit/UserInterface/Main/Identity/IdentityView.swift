//
//  IdentityView.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/05.
//

import UIKit

class IdentityView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "IdentityView"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
        setupTableView()
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        addButton.layer.borderColor = UIColor(named: "DoBit Black")!.cgColor
        addButton.layer.borderWidth = 1.0
        addButton.layer.cornerRadius = 28.5
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: IdentityTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: IdentityTableViewCell.identifier)
    }
}

// MARK: - Extensions

// MARK: UITableViewDelegate, UITableViewDataSource
extension IdentityView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IdentityTableViewCell.identifier, for: indexPath) as! IdentityTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
