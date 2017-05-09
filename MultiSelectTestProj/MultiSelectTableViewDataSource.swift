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

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MultiSelectTableViewReuseIdentifier, for: indexPath)
        cell.textLabel?.text = selectedItems[indexPath.row].multiSelectText
        cell.detailTextLabel?.text = selectedItems[indexPath.row].multiSelectDetailText
        return cell
    }
    
}
