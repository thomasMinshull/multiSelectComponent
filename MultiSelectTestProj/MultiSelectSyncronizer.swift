//
//  MultiSelectSyncronizer.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

struct MultiSelectSyncronizer: MultiSelectCollectionViewDelegate, MultiSelectHeaderViewDelegate {
    
    // MARK: MultiSelectHeaderViewDelegate
    
    func MultiSelectHeaderDidDeselectItem(multiSelectItem:MultiSelectItem) {
        
    }
    
    // MARK: MultiSelectCollectionViewDelegate
    
    func MultiSelectCollectionDidSelectItem(item:MultiSelectItem) {
        
    }
    
    func MultiSelectCollectionDidDeselectItem(item:MultiSelectItem) {
        
    }
}