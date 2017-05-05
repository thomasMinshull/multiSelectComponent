//
//  MultiSelectCollectionViewController.swift
//  multiSelectionViewController
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

class MultiSelectHeaderCollectionViewController: UICollectionViewController {
    
    private let ds = MultiSelectHeaderDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.dataSource = ds
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ds.reuseIdentifier)

    }
    
    //MARK: MultiSelectHeaderCollectionViewController Public Interface
    
    init() { // for testing
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
     //Need to resolve type issue
    var selectedItems: [AnyMultiSelectItem<MultiSelectItemHeaderTypeAlias>]! {
        return ds.selectedItems
    }
    
    func setupWithSelectedItems(selectedItems: [AnyMultiSelectItem<MultiSelectItemHeaderTypeAlias>]) {
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
