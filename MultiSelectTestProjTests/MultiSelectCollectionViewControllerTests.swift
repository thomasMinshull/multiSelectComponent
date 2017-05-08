//
//  MultiSelectCollectionViewControllerTests.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

@testable import MultiSelectTestProj
import Foundation
import Quick
import Nimble

class MultiSelectCollectionViewControllerTests: QuickSpec {
    override func spec() {
        let subject = MultiSelectCollectionViewController()
        
        it("should be able to set delegate") {
            class multiSelectCollectionViewDelegate: MultiSelectCollectionViewDelegate {
                func MultiSelectCollectionDidSelectItem(item:MultiSelectItem) {}
                func MultiSelectCollectionDidDeselectItem(item:MultiSelectItem) {}
            }
            
            let dup = multiSelectCollectionViewDelegate()
            subject.delegate = dup
            expect(subject.delegate).to(beIdenticalTo(dup))
        }
    }
}
