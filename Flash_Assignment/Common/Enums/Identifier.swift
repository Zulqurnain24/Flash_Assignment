//
//  Identifier.swift
//  Flash_Assignment
//
//  Created by Mohammad Zulqarnain on 18/06/2019.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

enum Identifier: String {
    typealias RawValue = String
    
    case dateFormatter = "en_US_POSIX"
    case dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    case desiredDateFormat = "MMM d, yyyy"
    case titleLabel = "titleLabel"
    case descriptionLabel = "descriptionLabel"
    case batteryLabel = "batteryLabel"
    case timestampLabel = "timestampLabel"
    case priceTimeLabel = "priceTimeLabel"
    case addressLabel = "addressLabel"
    case priceTimeUnit = "Seconds"
    case priceLabel = "priceLabel"
    case scootyMarker = "ScootyMarker"
    case scootyImage = "Scooty"
    case scootyAnnotation = "ScootyAnnotation"
}
