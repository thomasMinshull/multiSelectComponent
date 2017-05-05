//
//  MultiSelectHeaderDataSourceTests.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-04-27.
//  Copyright © 2017 DrBill. All rights reserved.
//

@testable import MultiSelectTestProj
import Foundation
import Quick
import Nimble

class MultiSelectHeaderDataSourceTests: QuickSpec {
    override func spec() {
        var subject: MultiSelectHeaderDataSource!
        var items = [MultiSelectItem]()
        let item1 = MultiSelectItem(multiSelectText: "Item1", multiSelectDetailText: "This is a dup for testing")
        let item2 = MultiSelectItem(multiSelectText: "Item2", multiSelectDetailText: "This is a dup for testing")
        
        beforeEach {
            subject = MultiSelectHeaderDataSource()
            items = [item1, item2]
        }
        
        it("should contain no selected items prior to set up") {
            expect(subject?.selectedItems).to(beEmpty())
        }
        
        it("should return the correct selected Items after setup") {
            subject.setupWithSelectedItems(selectedItems: items)
            expect(subject?.selectedItems).to(contain(item1, item2))
        }
        
        it("should remove deselected item for selectedItems list") {
            subject.setupWithSelectedItems(selectedItems: items)
            subject.remove(item: item1)
            expect(subject?.selectedItems).to(contain(item2))
            expect(subject?.selectedItems).toNot(contain(item1))
        }
        
        it("should add selected item") {
            subject.setupWithSelectedItems(selectedItems: [item1])
            subject.selectItem(selectedItem: item2)
            expect(subject?.selectedItems).to(contain(item2))
        }
        
        it("should not add multiple of the same selected item") {
            subject.setupWithSelectedItems(selectedItems: [item1])
            subject.selectItem(selectedItem: item1)
            expect(subject?.selectedItems.count).to(equal(1))
        }
    }
}

