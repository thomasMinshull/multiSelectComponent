//
//  MultiSelectTableViewControllerTests.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

@testable import MultiSelectTestProj
import Foundation
import Quick
import Nimble

class MultiSelectTableViewControllerTests: QuickSpec {
    override func spec() {
        let subject = MultiSelectTableViewController(style:UITableViewStyle.plain )
        
        it("should be able to set delegate") {
            class multiSelectTableViewDelegate: MultiSelectTableViewDelegate {
                func MultiSelectCollectionDidSelectItem(item:MultiSelectItem) {}
                func MultiSelectCollectionDidDeselectItem(item:MultiSelectItem) {}
            }
            
            let dup = multiSelectTableViewDelegate()
            subject.delegate = dup
            expect(subject.delegate).to(beIdenticalTo(dup))
        }
    }
}
