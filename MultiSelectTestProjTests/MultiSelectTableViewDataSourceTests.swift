//
//  MultiSelectTableViewDataSourceTests.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

@testable import MultiSelectTestProj
import Foundation
import Quick
import Nimble

class MultiSelectTableViewDataSourceTests: QuickSpec {
    override func spec() {
        let subject = MultiSelectTableViewDataSource()
        var item1: MultiSelectItem!
        var item2: MultiSelectItem!
        
        beforeEach {
            item1 = MultiSelectItem(multiSelectText: "Item1", multiSelectDetailText: "This is a dup for testing")
            item2 = MultiSelectItem(multiSelectText: "Item2", multiSelectDetailText: "This is a dup for testing")
            
            subject.selectedItems = [item1, item2]
        }

        it("should return nil for given invalid indexPath section ") {
            let ip = IndexPath(row: 1, section: 1)
            expect(subject.objectAt(indexPath: ip)).to(beNil())
        }
        
        it("should return nil for given invalid indexPath row") {
            let ip = IndexPath(row: 2, section: 0)
            expect(subject.objectAt(indexPath: ip)).to(beNil())
        }

        it("should return multiSelectItem for valid indexPath ") {
            let ip = IndexPath(row: 0, section: 0)
            expect(subject.objectAt(indexPath: ip)).to(beAnInstanceOf(MultiSelectItem.self))
            expect(subject.objectAt(indexPath: ip)).to(equal(item1))
        }
        
    }
}
