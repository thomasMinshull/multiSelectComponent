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
    @IBOutlet var deSelectButton: UIButton!
    
    @IBAction func deSelectButtonTapped(_ sender: Any, forEvent event: UIEvent) {
        // pass touch event up the responder chain
        guard let touches = event.allTouches else { return }
        self.next?.touchesBegan(touches, with: event)
        self.next?.touchesEnded(touches, with: event)
        self.next?.touchesMoved(touches, with: event)
        self.next?.touchesCancelled(touches, with: event)
    }
    
    // Consumes touch event that is not a button tap to prevent cell from being selected
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if wasButtonTapped(touches, with: event) {
            super.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if wasButtonTapped(touches, with: event) {
            super.touchesEnded(touches, with: event)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if wasButtonTapped(touches, with: event) {
            super.touchesMoved(touches, with: event)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if wasButtonTapped(touches, with: event) {
            super.touchesCancelled(touches, with: event)
        }
    }
    
    private func wasButtonTapped(_ touches: Set<UITouch>, with event: UIEvent?) -> Bool {
        for touch in touches {
            if (hitTest(touch.location(in: contentView), with: event) == deSelectButton.imageView) {
                return true
            }
        }
        return false
    }
}


