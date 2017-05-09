//
//  MultiSelectTableViewDataSource.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

class MultiSelectTableViewDataSource: NSObject, UITableViewDataSource {
    
    var selectedItems:[MultiSelectItem]!
    
    func objectAt(indexPath: IndexPath) -> MultiSelectItem? { 
        guard !(indexPath.section > 0) && (indexPath.row < selectedItems.count) else {
            return nil
        }
        return selectedItems[indexPath.row]
    }
    
    // MARK: TableViewDataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MultiSelectTableViewReuseIdentifier, for: indexPath)
        cell.textLabel?.text = selectedItems[indexPath.row].multiSelectText
        cell.detailTextLabel?.text = selectedItems[indexPath.row].multiSelectDetailText
        // to do handle cell.accessory type based on if selected or not
        return cell
    }
    
}
