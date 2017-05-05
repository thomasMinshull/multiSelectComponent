//
//  MultiSelectItem.swift
//  MultiSelectTestProj
//
//  Created by ThomasMinshull on 2017-05-04.
//  Copyright © 2017 DrBill. All rights reserved.
//

import Foundation

/// Multi Select Item Type Eraser!!!!

protocol MultiSelectItemProtocol: Equatable {
    var multiSelectText: String { get }
    var multiSelectDetailText: String { get }
}

private class _AnyMultiSelectItemBase: MultiSelectItemProtocol {

    init() {
        guard type(of: self) != _AnyMultiSelectItemBase.self else {
            fatalError("_AnyMultiSelectItemBase must be subclassed")
        }
    }
    
    var multiSelectText: String {
        get {
            fatalError("Must override multiSelectText")
        }
    }
    
    var multiSelectDetailText: String {
        get {
            fatalError("Must override multiSelectDetailText")
        }
    }
    
    static func ==(lhs: _AnyMultiSelectItemBase, rhs: _AnyMultiSelectItemBase) -> Bool {
        fatalError("Must override == for _AnyMultiSelectItemBase")
    }

}


private final class _AnyMultiSelectItemBox<Concrete: MultiSelectItemProtocol>: _AnyMultiSelectItemBase {
    var concrete: Concrete // variable used since we're calling mutating functions
    
    init(_ concrete: Concrete) {
        self.concrete = concrete
    }
    
    override var multiSelectText: String {
        get {
            return concrete.multiSelectText
        }
    }
    
    override var multiSelectDetailText: String {
        get {
            return concrete.multiSelectDetailText
        }
    }
    
    static func ==(lhs: _AnyMultiSelectItemBox<Concrete>, rhs: _AnyMultiSelectItemBox<Concrete>) -> Bool {
        return lhs.concrete == rhs.concrete
    }
    
    
}

final class AnyMultiSelectItem<selfTypeParameter: MultiSelectItemProtocol>: MultiSelectItemProtocol {
    fileprivate let box: _AnyMultiSelectItemBase // where selfTypeParameter : MultiSelectItemProtocol
    
    init<selfTypeParameter: MultiSelectItemProtocol>(_ concrete: selfTypeParameter) {
        box = _AnyMultiSelectItemBox(concrete)
    }
    
    var multiSelectText: String {
        get {
            return box.multiSelectText
        }
    }
    
    var multiSelectDetailText: String {
        get {
            return box.multiSelectDetailText
        }
    }
    
    static func ==(lhs: AnyMultiSelectItem<selfTypeParameter>, rhs: AnyMultiSelectItem<selfTypeParameter>) -> Bool {
        return lhs.box == rhs.box
    }
}

class MultiSelectItem: MultiSelectItemProtocol {
    var multiSelectText = "multiSelectText" // TODO refactor out multiSelect form variable names
    var multiSelectDetailText = "multiSelectDetailText"
    
    init(text: String, detailText: String) {
        multiSelectText = text
        multiSelectDetailText = detailText
    }
    
    static func ==(lhs: MultiSelectItem, rhs: MultiSelectItem) -> Bool {
        return lhs.multiSelectText == rhs.multiSelectText && lhs.multiSelectDetailText == rhs.multiSelectDetailText
    }
}
 

