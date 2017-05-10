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
    
    func removeItem(at indexPath: IndexPath) -> MultiSelectItem? {
        guard indexPath.section == 0 && indexPath.row < selectedItems.count else {
            return nil
        }
        return selectedItems.remove(at: indexPath.row)
    }
    
    func add(selectedItem: MultiSelectItem, completion:(Bool)->()) { 
        guard !(selectedItems.contains(selectedItem)) else { return completion(false)}
        selectedItems.append(selectedItem)
        completion(true)
    }
    
    func indexPathFor(item: MultiSelectItem) -> IndexPath? {
        guard selectedItems.contains(item) else {
            return nil
        }
        
        var int = 0
        
        for selectedItem in selectedItems {
            if selectedItem == item {
                break
            }
            int = int + 1
        }
        
        return IndexPath(row: int, section: 0)
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
