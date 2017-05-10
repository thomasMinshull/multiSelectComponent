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
        
        // MARK: Set up
        
        it("should contain no selected items prior to set up") {
            expect(subject?.selectedItems).to(beEmpty())
        }
        
        
        it("should return the correct selected Items after setup") {
            subject.setupWithSelectedItems(selectedItems: items)
            expect(subject?.selectedItems).to(contain(item1, item2))
        }
        
        // MARK: Remove
        
        it("should remove deselected item for selectedItems list") {
            subject.setupWithSelectedItems(selectedItems: items)
            subject.remove(item: item1)
            expect(subject?.selectedItems).to(contain(item2))
            expect(subject?.selectedItems).toNot(contain(item1))
        }
        
        // MARK: add selectItem
        
        it("should add selected item") {
            subject.setupWithSelectedItems(selectedItems: [item1])
            subject.add(selectedItem: item2) { success in }
            expect(subject?.selectedItems).to(contain(item2))
        }
        
        it("should pass true into completion if valid item") {
            subject.setupWithSelectedItems(selectedItems: [item1])
            subject.add(selectedItem: item2) { success in
            expect(success).to(beTrue())
            }
        }
        
        it("should not add multiple of the same selected item") {
            subject.setupWithSelectedItems(selectedItems: [item1])
            subject.add(selectedItem: item1) { success in }
            expect(subject?.selectedItems.count).to(equal(1))
        }
        
        it("should pass false into completion if duplicate item") {
            subject.setupWithSelectedItems(selectedItems: [item1])
            subject.add(selectedItem: item1) { success in
                expect(success).to(beFalse())
            }
        }
        
        // MARK: indexPathFor(item)

        it("should return nil given an invalid MultiSelectItem") {
            subject.setupWithSelectedItems(selectedItems: items)
            let differentItem = MultiSelectItem(multiSelectText: "Different Item", multiSelectDetailText: "")
            expect(subject?.indexPathFor(item: differentItem)).to(beNil())
        }
        
        it("should return an indexPath given a valid MultiSelectItem") {
            subject.setupWithSelectedItems(selectedItems: items)
            let ip = IndexPath(row: 0, section: 0)
            expect(subject?.indexPathFor(item: item1)).to(equal(ip))
        }
        
        // MARK: remove
        
        it("should remove item given valid indexPath") {
            subject.setupWithSelectedItems(selectedItems: items)
            let ip = IndexPath(row: 0, section: 0)
            subject?.removeItem(at: ip)
            expect(subject?.selectedItems.count).to(equal(1))
            expect(subject?.selectedItems).to(contain(item2))
            expect(subject?.selectedItems).toNot(contain(item1))
        }
        
        it("should not remove items given indexPath with invalid row") {
            subject.setupWithSelectedItems(selectedItems: items)
            let ip = IndexPath(row: 2, section: 0)
            subject?.removeItem(at: ip)
            expect(subject?.selectedItems.count).to(equal(2))
            expect(subject?.selectedItems).to(contain(items))
        }

        it("should not remove items given indexPath with invalid section") {
            subject.setupWithSelectedItems(selectedItems: items)
            let ip = IndexPath(row: 0, section: 2)
            subject?.removeItem(at: ip)
            expect(subject?.selectedItems.count).to(equal(2))
            expect(subject?.selectedItems).to(contain(items))
        }
    }
}

