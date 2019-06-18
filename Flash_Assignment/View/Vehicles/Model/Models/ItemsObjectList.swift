//
//  ItemsObjectList.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/**
 This Model have objects for views and all data about vehicles
 */
struct ItemsObjectList: Equatable {
    static func == (lhs: ItemsObjectList, rhs: ItemsObjectList) -> Bool {
        return lhs.results == rhs.results
    }

    ///All vehicles
    var results        : [ItemObject]

    /**
     Receive parameters for initializer the struct from api
     - Parameter results
     */
    init(results:[ItemObject]){
        self.results = results
    }

    /**
     This init receive data from Json, return nil in case the struct not is available, if all data is true  call super init fof the struct
     - Parameter json : Data from Api Rest
     */
    init?(json: JsonDictionay) {
        guard let results         = ItemObject.createRequiredInstances(from: json , key: "vehicles") else { return nil }
        self.init(results:results)
    }
}
