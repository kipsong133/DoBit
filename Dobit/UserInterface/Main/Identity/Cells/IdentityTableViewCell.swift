//
//  IdentityTableViewCell.swift
//  Dobit
//
//  Created by 박현우 on 2022/08/07.
//

import UIKit

class IdentityTableViewCell: UITableViewCell {
    static let identifier = "IdentityTableViewCell"
    
    @IBOutlet weak var colorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helpers
    func setupView() {
        backgroundColor = UIColor(named: "DoBit Grey") ?? .white
        selectionStyle = .none
        preservesSuperviewLayoutMargins = false
        separatorInset = .zero
        layoutMargins = .zero
        
        colorView.cornerRadius = 11
    }
}
