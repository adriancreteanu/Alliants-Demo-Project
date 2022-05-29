//
//  RepoTableViewCell.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import UIKit

class VendorTableViewCell: UITableViewCell {
    
    static let identifier: String = "VendorCell"
    
    @IBOutlet var vendorImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var availabilityLabel: UILabel!
    
    // MARK: - Setup
    
    func configure(data: VendorViewData) {
        vendorImageView.backgroundColor = .blue
        nameLabel.text = data.name
    }
}
