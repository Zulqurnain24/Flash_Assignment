//
//  Vehicles.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain All rights reserved.
//

import Foundation

enum Vehicles: String {

    case titleLabel = "TITLE_LABEL"
    case descriptionLabel = "DESCRIPTION_LABEL"
    case batteryLevel = "BATTERY_LEVEL"
    case timestamp = "TIME_STAMP"
    case priceLabel = "PRICE_LABEL"
    case priceTimeLabel = "PRICE_TIME_LABEL"
    case addressLabel = "ADDRESS_LABEL"
    case alertTitle = "ALERT_TITLE"
    case networkErrorMessage = "NETWORK_ERROR_MESSAGE"
    case affirmation = "AFFIRMATION"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension Vehicles: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
