//
//  MultiSelectHeaderDataSource.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit


typealias MultiSelectItemHeaderTypeAlias = MultiSelectItem // TODO can I make this dynamic so I could change it, Should this be in the MultiSelectItem.swift file??

class MultiSelectHeaderDataSource: NSObject, UICollectionViewDataSource {
    let reuseIdentifier = "Cell"
 //need to resolve type issue
    private (set) var selectedItems = [AnyMultiSelectItem<MultiSelectItemHeaderTypeAlias>]()
    
    // MARK: MultiSelectHeaderDataSource Public Interface
    
    func setupWithSelectedItems(selectedItems: [AnyMultiSelectItem<MultiSelectItemHeaderTypeAlias>]) {
        self.selectedItems = selectedItems
    }
    
    func deSelect(multiSelectItem item: AnyMultiSelectItem<MultiSelectItemHeaderTypeAlias>) {
        let index = selectedItems.index(of: item)
        
        
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
