//
//  MultiSelectTableViewController.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

import UIKit

protocol MultiSelectTableViewDelegate {
    func MultiSelectCollectionDidSelectItem(item:MultiSelectItem)
    func MultiSelectCollectionDidDeselectItem(item:MultiSelectItem)
}

private let reuseIdentifier = "Cell"

class MultiSelectTableViewController: UITableViewController {
    
    var delegate:MultiSelectTableViewDelegate?
    var ds:MultiSelectTableViewDataSource!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }


 
    // MARK: UITableViewDelegate 
}
