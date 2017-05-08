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
        var subject = MultiSelectSyncronizer()  
        
        it("should conform to MultiSelectHeaderViewProctocol") {
            expect(subject).to(beAKindOf(MultiSelectHeaderViewProctocol.self))
        }
        
        it("should conform to MultiSelectCollectionViewProtocol") {
            expect(subject).to(beAKindOf(MultiSelectCollectionViewProtocol.self))
        }
        
        // test if we call did select item at index is message triggered? 
    
    }
}
