//
//  VendorsListViewController.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import UIKit

class VendorsListViewController: UITableViewController {
    // MARK: - Properties
    
    private var activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = "Vendors"
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let cellNib = UINib(nibName: "VendorTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: VendorTableViewCell.identifier)
        tableView.backgroundView = activityIndicator
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VendorTableViewCell.identifier, for: indexPath) as? VendorTableViewCell else {
            fatalError("Dequeued cell is of incorrect type.")
        }
        
        cell.configure()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
