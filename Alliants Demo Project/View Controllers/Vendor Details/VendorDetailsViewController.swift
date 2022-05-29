//
//  VendorDetailsViewController.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import UIKit

final class VendorDetailsViewController: UIViewController {
    @IBOutlet var vendorImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: VendorDetailsViewModelDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        navigationItem.title = "About"
        
        vendorImageView.loadIfNeeded(url: viewModel.viewData.imageURL)
        descriptionLabel.text = viewModel.viewData.description
    }
}
