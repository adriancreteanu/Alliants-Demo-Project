//
//  VendorListViewModel.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

enum VendorListViewState {
    case loading
    case updated
    case failure(Error)
}

protocol VendorListViewModelDelegate: AnyObject {
    typealias ViewStateChange = (VendorListViewState) -> Void
    
    var onStateChange: ViewStateChange? { get set }
    
    func onViewDidLoad() 
    
    // Data Source
    
    var numberOfItems: Int { get }
    
    func item(atRow row: Int) -> VendorViewData
    
    func didSelectItem(atRow row: Int)
}
