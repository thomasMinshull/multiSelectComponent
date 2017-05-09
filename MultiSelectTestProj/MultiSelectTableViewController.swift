//
//  MultiSelectTableViewController.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

protocol MultiSelectTableViewDelegate {
    func MultiSelectTableViewDidSelectItem(item:MultiSelectItem)
    func MultiSelectTableViewDidDeselectItem(item:MultiSelectItem)
}

let MultiSelectTableViewReuseIdentifier = "MultiSelectTableViewReuseIdentifierCell"

class MultiSelectTableViewController: UITableViewController {
    
    var delegate:MultiSelectTableViewDelegate?
    var ds:MultiSelectTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: MultiSelectTableViewReuseIdentifier)
        tableView.dataSource = ds
        
    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = ds.objectAt(indexPath: indexPath) {
            delegate?.MultiSelectTableViewDidSelectItem(item: item)
        }
    }
    
    override public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    

}
