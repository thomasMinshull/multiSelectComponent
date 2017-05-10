//
//  MultiSelectViewController.swift
//  multiSelectionViewController
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

class MultiSelectViewController: UIViewController, MultiSelectHeaderViewDelegate, MultiSelectTableViewDelegate {
    
    private let headerViewControllerSegue = "HeaderViewControllerSegue"
    private let mainViewControllerSegue = "MainViewControllerSegue"
    
    var headerViewContoller: MultiSelectHeaderCollectionViewController?
    var multiSelectTableViewContoller: MultiSelectTableViewController?

    let selectedItems = [MultiSelectItem(multiSelectText:"First Item", multiSelectDetailText:"detail Text"), MultiSelectItem(multiSelectText:"Second Item", multiSelectDetailText:"detail Text"), MultiSelectItem(multiSelectText:"Third Item", multiSelectDetailText:"detail Text")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupWithSelectedItems(selectedItems: [MultiSelectItem]) {
        //TODO implement
        
    }
    
    // MARK: MultiSelectHeaderViewDelegate
    func MultiSelectHeaderDidDeselectItem(multiSelectItem:MultiSelectItem) {
        guard let mstvc = multiSelectTableViewContoller else {
            return
        }
        
//        mstvc.tableView.dataSource.inde
    }
    
    // MARK: MultiSelectHeaderViewDelegate
    func MultiSelectTableViewDidSelectItem(item:MultiSelectItem) {
        guard let hvc =  headerViewContoller else {
            return
        }
        
        hvc.ds.add(selectedItem: item) { success in
            if let ip = hvc.ds.indexPathFor(item: item), success {
                hvc.collectionView?.insertItems(at: [ip])
            }
        }
        
    }
    
    func MultiSelectTableViewDidDeselectItem(item:MultiSelectItem) {
        guard let hvc = headerViewContoller else {
            return
        }
        hvc.removeItem(item: item)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == headerViewControllerSegue {
            let collectionVC = segue.destination as! MultiSelectHeaderCollectionViewController
            headerViewContoller = collectionVC
            let headerDataSource = MultiSelectHeaderDataSource()
            headerDataSource.setupWithSelectedItems(selectedItems: []) // TODO change this to be the same as bellow
            collectionVC.ds = headerDataSource // TODO check that this is loading properly
        } else if segue.identifier == mainViewControllerSegue {
            let tableVC = segue.destination as! MultiSelectTableViewController
            tableVC.delegate = self
            multiSelectTableViewContoller = tableVC
            let multiSelectDataSource = MultiSelectTableViewDataSource()
            multiSelectDataSource.items = selectedItems // TODO this should be a copy of this array not a pointer to the array
            tableVC.ds = multiSelectDataSource
        }
    }

}
