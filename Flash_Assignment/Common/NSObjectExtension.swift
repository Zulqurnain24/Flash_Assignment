//
//  NSObjectExtension.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    // Name Of class
    class var stringRepresentation: String {
        let name = String(describing: self)
        return name
    }
}

protocol CreateFromArray {
    
    init?(json: JsonDictionay )
}

extension CreateFromArray {
    
    ///Create array of items from json
    static func createRequiredInstances(from json: JsonDictionay , key:String) -> [Self]? {
        guard let jsonDictionaries = json[key] as? [[String: Any]] else { return nil }
        var array = [Self]()
        for jsonDictionary in jsonDictionaries {
            guard let instance = Self.init(json: jsonDictionary) else { return nil }
            array.append(instance)
        }
        return array
    }
}
