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

    let selectedItems = [MultiSelectItem(multiSelectText:"First Item", multiSelectDetailText:"detail Text"), MultiSelectItem(multiSelectText:"Second Item", multiSelectDetailText:"detail Text"), MultiSelectItem(multiSelectText:"Third Item", multiSelectDetailText:"detail Text")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupWithSelectedItems(selectedItems: [MultiSelectItem]) {
        //TODO implement
        
    }
    
    // MARK: MultiSelectHeaderViewDelegate
    func MultiSelectHeaderDidDeselectItem(multiSelectItem:MultiSelectItem) {
        
    }
    
    // MARK: MultiSelectHeaderViewDelegate
    func MultiSelectCollectionDidSelectItem(item:MultiSelectItem) {
        
    }
    
    func MultiSelectCollectionDidDeselectItem(item:MultiSelectItem) {
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == headerViewControllerSegue {
            let collectionVC = segue.destination as! MultiSelectHeaderCollectionViewController
            let headerDataSource = MultiSelectHeaderDataSource()
            headerDataSource.setupWithSelectedItems(selectedItems: selectedItems) // TODO change this to be the same as bellow 
            collectionVC.ds = headerDataSource // TODO check that this is loading properly
        } else if segue.identifier == mainViewControllerSegue {
            let tableVC = segue.destination as! MultiSelectTableViewController
            let multiSelectDataSource = MultiSelectTableViewDataSource()
            multiSelectDataSource.selectedItems = selectedItems // TODO this should be a copy of this array not a pointer to the array
            tableVC.ds = multiSelectDataSource
        }
    }

}
