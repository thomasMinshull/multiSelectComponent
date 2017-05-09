//
//  MultiSelectHeaderDataSource.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

class MultiSelectHeaderDataSource: NSObject, UICollectionViewDataSource {
    
    private (set) var selectedItems = [MultiSelectItem]()
    let reuseIdentifier = MultiSelectCollectionViewCellIdentifier
    
    // MARK: MultiSelectHeaderDataSource Public Interface 
    
    func setupWithSelectedItems(selectedItems: [MultiSelectItem]) {
        self.selectedItems = selectedItems
    }
    
    func remove(item: MultiSelectItem) {
        if let index = selectedItems.index(of: item) {
            selectedItems.remove(at: index)
        }
    }
    
    func selectItem(selectedItem: MultiSelectItem) {
        guard !(selectedItems.contains(selectedItem)) else { return }
        selectedItems.append(selectedItem)
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MultiSelectCollectionViewCell
        
        let item = selectedItems[indexPath.row]
        
        cell.textLabel.text = item.multiSelectText
        cell.detailTextLabel.text = item.multiSelectDetailText
        
        return cell
    }
    
}
