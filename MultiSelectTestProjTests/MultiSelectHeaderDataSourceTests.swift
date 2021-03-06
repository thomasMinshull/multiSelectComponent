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
        var items = [AnyMultiSelectItem<MultiSelectItemHeaderTypeAlias>]()
        let item1 = MultiSelectItem(text: "Item1", detailText: "This is a dup for testing")
        let item2 = MultiSelectItem(text: "Item2", detailText: "This is a dup for testing")
        let wrappedItem1 = AnyMultiSelectItem<MultiSelectItem>(item1)
        let wrappedItem2 = AnyMultiSelectItem<MultiSelectItem>(item2)
        
        beforeEach {
            subject = MultiSelectHeaderDataSource()
            items = [wrappedItem1, wrappedItem2]
        }
        
        it("should contain no selected items prior to set up") {
            expect(subject?.selectedItems).to(beEmpty())
        }
        
        it("should return the correct selected Items after setup") {
            subject.setupWithSelectedItems(selectedItems: items)
            expect(subject?.selectedItems).to(contain(wrappedItem1, wrappedItem2))
        }
        
        it("should remove deselected item for selectedItems list") {
            subject.setupWithSelectedItems(selectedItems: items)
            //subject.remove(item: item1)
            
        }
    }
}

