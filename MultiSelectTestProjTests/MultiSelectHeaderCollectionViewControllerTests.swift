//
//  MultiSelectHeaderCollectionViewControllerTests.swift
//  MultiSelectHeaderCollectionViewControllerTests
//
//  Created by ThomasMinshull on 2017-04-26.
//  Copyright © 2017 DrBill. All rights reserved.
//

@testable import MultiSelectTestProj
import Foundation
import Quick
import Nimble

class MultiSelectHeaderCollectionViewControllerTests: QuickSpec {
    override func spec() {
        var subject: MultiSelectHeaderCollectionViewController!
        var items = [MultiSelectItem]()
        let item1 = MultiSelectItem(multiSelectText:"Item1", multiSelectDetailText:"This is a dup for testing")
        
        beforeEach {
            subject = MultiSelectHeaderCollectionViewController()
            items = [item1]
            
        }
        
        it("should contain no selected items prior to set up") {
            expect(subject?.selectedItems!).to(beEmpty())
        }
        
        it("should return the correct selected Items after setup") {
            subject.setupWithSelectedItems(selectedItems: items)
            expect(subject?.selectedItems).to(contain(item1))
        }
        
    }
}
