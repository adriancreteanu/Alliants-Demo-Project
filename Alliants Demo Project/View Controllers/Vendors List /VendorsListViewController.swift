//
//  VendorsListViewController.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import UIKit

final class VendorsListViewController: UITableViewController {
    // MARK: - Properties
    
    var viewModel: VendorListViewModelDelegate!
    
    private var activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = "Vendors"
    }
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let cellNib = UINib(nibName: "VendorTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: VendorTableViewCell.identifier)
        tableView.backgroundView = activityIndicator
    }
    
    private func setupViewModel() {
        viewModel.onStateChange = { [weak self] state in
            self?.update(state: state)
        }
        
        viewModel.onViewDidLoad()
    }
    
    private func update(state: VendorListViewState) {
        switch state {
        case .loading:
            handleLoadingIndicator(isLoading: true)
        case .updated:
            handleLoadingIndicator(isLoading: false)
            tableView.reloadData()
           
        case .failure:
            handleLoadingIndicator(isLoading: false)
        }
    }
    
    private func handleLoadingIndicator(isLoading: Bool) {
        isLoading ?
            activityIndicator.startAnimating() :
            activityIndicator.stopAnimating()
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VendorTableViewCell.identifier, for: indexPath) as? VendorTableViewCell else {
            fatalError("Dequeued cell is of incorrect type.")
        }
        
        let item = viewModel.item(atRow: indexPath.row)
        cell.configure(data: item)
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
}
