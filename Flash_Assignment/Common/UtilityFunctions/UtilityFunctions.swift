//
//  UtilityFunctions.swift
//  Flash-Assignment
//
//  Created by Mohammad Zulqarnain on 16/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import MapKit
import Reachability

class UtilityFunctions {
    
    static let shared = UtilityFunctions()
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: Identifier.dateFormatter.rawValue) // set locale to reliable US_POSIX
        dateFormatter.dateFormat = Identifier.dateFormat.rawValue
        guard let dateString = dateString as String?, !dateString.isEmpty,
              let date = dateFormatter.date(from: dateString) else { return "" }
        dateFormatter.dateFormat = Identifier.desiredDateFormat.rawValue ; //"dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale --> but no need here
        guard let stringValue = dateFormatter.string(from: date) as String? else { return "" }
        return stringValue
    }

    func convertLatLongToAddress(latitude: Double, longitude: Double, completionHandler: @escaping (String) -> Void) {
        guard let reachability = Reachability(), reachability.connection != .none else {return}
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            guard reachability.connection != .none else { return }
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            // Street address
            guard let street = placeMark.thoroughfare as String? else {
                completionHandler("")
                return }
            completionHandler(street)
        })
        
    }
}
