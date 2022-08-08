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
        setupView()
        setupTableView()
    }
    
    // MARK: - Actions
    @objc private func addButtonHandleTap(_ sender: UITapGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(withIdentifier: IdentityFormView.storyboardName) as! IdentityFormView
        navigationController?.pushViewController(vc, animated: true)
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
    
    private func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(addButtonHandleTap(_:)))
        addButton.addGestureRecognizer(tap)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        // TODO: tableView의 separatorColor 색상이 다르게 나오는 문제 해결 필요
        
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
