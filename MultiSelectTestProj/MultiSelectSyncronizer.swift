//
//  MultiSelectSyncronizer.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

struct MultiSelectSyncronizer: MultiSelectCollectionViewProtocol, MultiSelectHeaderViewProctocol {
    
    // MARK: MultiSelectHeaderViewProctocol
    
    func MultiSelectHeaderDidDeselectItem(multiSelectItem:MultiSelectItem) {
        
    }
    
    // MARK: MultiSelectCollectionViewProtocol
    
    func MultiSelectCollectionDidSelectItem(item:MultiSelectItem) {
        
    }
    
    func MultiSelectCollectionDidDeselectItem(item:MultiSelectItem) {
        
    }
}
