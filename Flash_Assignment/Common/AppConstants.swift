//
//  AppConstants.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Foundation
import MapKit

struct AppConstants {
    //Network related
    static let protocolo    : String = "https://"
    static let domain       : String = "my-json-server.typicode.com/FlashScooters/Challenge"
    static let baseUrl      : String = AppConstants.protocolo + AppConstants.domain
    
    //Map related
    static let userCoordinate = CLLocationCoordinate2D(latitude: 52.529077, longitude: 13.416351)
    static let eyeCoordinate = CLLocationCoordinate2D(latitude: 52.529077, longitude: 13.416351)
    static let eyeAltitude = 100.0
    static let latitudeAndLongitudinalDelta = 0.01
}
