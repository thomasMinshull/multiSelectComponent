//
//  MultiSelectCollectionViewCell.swift
//  multiSelectionViewController
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

let MultiSelectCollectionViewCellIdentifier = "MultiSelectCollectionViewCell"

class MultiSelectCollectionViewCell: UICollectionViewCell {
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var detailTextLabel: UILabel!
  
    @IBAction func deSelectButtonTapped(_ sender: Any) {
        
    }
}
