//
//  MultiSelectTableViewController.swift
//  multiSelectionViewController
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

protocol MultiSelectItemProtocol {
    var multiSelectText: String { get }
    var multiSelectDetailText: String { get }

 }

struct  MultiSelectItem: MultiSelectItemProtocol, Equatable {
    var multiSelectText: String
    var multiSelectDetailText: String
    
    static func ==(lhs: MultiSelectItem, rhs: MultiSelectItem) -> Bool {
        return lhs.multiSelectText == rhs.multiSelectText && lhs.multiSelectDetailText == rhs.multiSelectDetailText
    }
}

protocol MultiSelectHeaderViewDelegate {
    func MultiSelectHeaderDidDeselectItem(multiSelectItem:MultiSelectItem)
}

class MultiSelectHeaderCollectionViewController: UICollectionViewController {
    
    var ds: MultiSelectHeaderDataSource!
    
    var delegate: MultiSelectHeaderViewDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.dataSource = ds
    }
    
    //MARK: MultiSelectHeaderCollectionViewController Public Interface
    
    init() { // for testing
        let layout = UICollectionViewFlowLayout()
        ds = MultiSelectHeaderDataSource()
        super.init(collectionViewLayout: layout)
    }
    
    var selectedItems: [MultiSelectItem]! {
        return ds.selectedItems
    }
    
    func setupWithSelectedItems(selectedItems: [MultiSelectItem]) {
        ds.setupWithSelectedItems(selectedItems: selectedItems)
        collectionView?.reloadData() 
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
