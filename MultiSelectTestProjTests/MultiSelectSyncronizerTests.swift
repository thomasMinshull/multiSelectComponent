//
//  MultiSelectSyncronizerTests.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-08.
//  Copyright © 2017 DrBill. All rights reserved.
//

@testable import MultiSelectTestProj
import Foundation
import Quick
import Nimble

class MultiSelectSyncronizerTests: QuickSpec {
    override func spec() {
        let subject = MultiSelectSyncronizer()
        
        it("should conform to MultiSelectHeaderViewDelegate") {
            expect(subject).to(beAKindOf(MultiSelectHeaderViewDelegate.self))
        }
        
        it("should conform to MultiSelectCollectionViewDelegate") {
            expect(subject).to(beAKindOf(MultiSelectCollectionViewDelegate.self))
        }
        
        // TODO test if we call did select item at index is message triggered? 
        
        
    
    }
}
