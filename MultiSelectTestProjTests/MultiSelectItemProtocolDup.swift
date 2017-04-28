//
//  MultiSelectItemProtocolDup.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-04-27.
//  Copyright © 2017 DrBill. All rights reserved.
//


@testable import MultiSelectTestProj
import Foundation
import Quick
import Nimble

class MultiSelectItemProtocolDup: Any, MultiSelectItemProtocol {
    var multiSelectText: String
    var multiSelectDetailText: String
    
    init(text: String, detailText: String) {
        multiSelectText = text
        multiSelectDetailText = detailText
    }
}
