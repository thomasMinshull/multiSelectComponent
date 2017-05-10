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
    var selected: Bool { get set }
 }

struct  MultiSelectItem: MultiSelectItemProtocol, Equatable {
    var multiSelectText: String
    var multiSelectDetailText: String
    var selected: Bool
    
    init(multiSelectText: String, multiSelectDetailText: String, selected: Bool = false) {
        self.multiSelectText = multiSelectText
        self.multiSelectDetailText = multiSelectDetailText
        self.selected = selected
    }
    
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
    
    func removeItem(item: MultiSelectItem) { 
        guard let ip = ds.indexPathFor(item: item) else {
            return
        }
        
        ds.remove(item: item)
        collectionView?.deleteItems(at: [ip])
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = ds.removeItem(at: indexPath) else {
            return
        }
        collectionView.deleteItems(at: [indexPath])
        delegate?.MultiSelectHeaderDidDeselectItem(multiSelectItem:item)
    }

}
