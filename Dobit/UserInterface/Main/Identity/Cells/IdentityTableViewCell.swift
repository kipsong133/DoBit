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
        setupLayout()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helpers
    func setupLayout() {
        backgroundColor = UIColor(named: "DoBit Grey") ?? .white
        selectionStyle = .none
        
        colorView.cornerRadius = 11
    }
}
