//
//  MultiSelectHeaderDataSource.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

class MultiSelectHeaderDataSource: NSObject, UICollectionViewDataSource {

    let reuseIdentifier = "Cell"
    private (set) var selectedItems = [MultiSelectItem]()
    
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell
        
        return cell
    }
    
}
