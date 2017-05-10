//
//  MultiSelectTableViewDataSource.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

class MultiSelectTableViewDataSource: NSObject, UITableViewDataSource {
    
    var selectedItems: [MultiSelectItem]! {
        return items.filter { (item) -> Bool in return item.selected }
    }
    
    var items:[MultiSelectItem]!
    
    func selectItem(at indexPath: IndexPath) {
        guard valid(indexPath: indexPath), var item = objectAt(indexPath: indexPath) else {
            return
        }
        item.selected = true
    }
    
    func deSelectItem(at indexPath: IndexPath) {
        guard valid(indexPath: indexPath), var item = objectAt(indexPath: indexPath), selectedItems.contains(item) else {
            return
        }
        item.selected = false
    }
    
    func objectAt(indexPath: IndexPath) -> MultiSelectItem? { 
        guard valid(indexPath: indexPath) else {
            return nil
        }
        return items[indexPath.row]
    }
    
    func indexPath(of item:MultiSelectItem) -> IndexPath? {
        guard items.contains(item) else {
            return nil
        }
        var row = 0
        for localItem in items {
            if localItem == item {
                break
            }
            row = row + 1
        }
        return IndexPath(row: row, section: 0)
    }
    
    private func valid(indexPath: IndexPath) -> Bool {
        guard !(indexPath.section > 0) && (indexPath.row < items.count) else {
            return false
        }
        return true
    }
    
    // MARK: TableViewDataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MultiSelectTableViewReuseIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.multiSelectText
        cell.detailTextLabel?.text = item.multiSelectDetailText
        cell.accessoryType = item.selected ? .checkmark : .none
        return cell
    }
    
    
}
