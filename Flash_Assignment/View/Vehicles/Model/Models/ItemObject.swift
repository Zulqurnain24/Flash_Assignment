//
//  Item.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation


/// Model for object Vehicles
struct ItemObject: CreateFromArray, Equatable {
    
    /// Id from db
    let id              : Int
    /// name of the vehicle
    let name            : String
    /// description of the vehicle
    let description     : String
    /// latitude of the vehcile location
    let latitude        : Double
    /// longitude of the vehcile location
    let longitude       : Double
    /// batteryLevel of vehicle
    let batteryLevel    : Int
    /// timestamp of vehicle
    let timestamp       : String
    /// price of vehicle
    let price           : Float
    /// priceTime of vehicle
    let priceTime       : Int
    /// currency of price of vehicle
    let currency        : String
    
    ///Receive parameters for initializer the struct from api, is called from init JSON
    init(id: Int, name: String, description: String, latitude: Double, longitude: Double, batteryLevel: Int, timestamp: String, price: Float, priceTime       : Int, currency: String){
        self.id            = id
        self.name          = name
        self.description   = description
        self.latitude      = latitude
        self.longitude     = longitude
        self.batteryLevel  = batteryLevel
        self.timestamp     = timestamp
        self.price         = price
        self.priceTime     = priceTime
        self.currency      = currency
    }
    
    /**
     This init receive and validate data from Json, return nil in case the struct not is available, if all data is true  call super init fof the struct
     - Parameter json : Data from Api Rest
     */
    init?(json: JsonDictionay) {
        guard let id            = json["id"] as? Int else { return nil }
        guard let name          = json["name"] as? String else { return nil }
        let description         = json["description"] as? String ?? ""
        guard let latitude      = json["latitude"] as? Double else { return nil }
        guard let longitude     = json["longitude"] as? Double else { return nil }
        let batteryLevel        = json["batteryLevel"] as? Int ?? 0
        let timestamp           = json["timestamp"] as? String ?? ""
        let price               = json["price"] as? Float ?? 0.0
        let priceTime           = json["priceTime"] as? Int ?? 0
        let currency            = json["currency"] as? String ?? ""
        
        self.init(id: id, name: name, description: description, latitude: latitude, longitude: longitude, batteryLevel: batteryLevel, timestamp: timestamp, price: price, priceTime: priceTime, currency: currency)
    }
    
    /**
     This is comparison operator for comparing ItemObject objects
     - Parameter : lhs ItemObject object, rhs ItemObject object
     */
    static func == (lhs: ItemObject, rhs: ItemObject) -> Bool {
        return lhs.batteryLevel == rhs.batteryLevel
                &&
                lhs.currency == rhs.currency
                &&
                lhs.description == rhs.description
                &&
                lhs.id == rhs.id
                &&
                lhs.latitude == rhs.latitude
                &&
                lhs.longitude == rhs.longitude
                &&
                lhs.name == rhs.name
                &&
                lhs.price == rhs.price
                &&
                lhs.priceTime == rhs.priceTime
                &&
                lhs.timestamp == rhs.timestamp
    }
}
