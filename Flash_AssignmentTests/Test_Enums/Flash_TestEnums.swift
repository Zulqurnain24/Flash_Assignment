//
//  Flash_TestVehicleDetailView.swift
//  Flash_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 19/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain All rights reserved.
//

import UIKit
import XCTest
@testable import Flash_Assignment

class Flash_TestEnums: XCTestCase {
    
    func testEnums() {
        checkStringValue(Identifier.dateFormatter.rawValue, "en_US_POSIX")
        checkStringValue(Identifier.dateFormat.rawValue, "yyyy-MM-dd'T'HH:mm:ssZ")
        checkStringValue(Identifier.desiredDateFormat.rawValue, "MMM d, yyyy")
        checkStringValue(Identifier.titleLabel.rawValue, "titleLabel")
        checkStringValue(Identifier.descriptionLabel.rawValue, "descriptionLabel")

        checkStringValue(Identifier.batteryLabel.rawValue, "batteryLabel")
        checkStringValue(Identifier.timestampLabel.rawValue, "timestampLabel")
        checkStringValue(Identifier.priceTimeLabel.rawValue, "priceTimeLabel")
        checkStringValue(Identifier.addressLabel.rawValue, "addressLabel")
        checkStringValue(Identifier.priceTimeUnit.rawValue, "Seconds")
        checkStringValue(Identifier.scootyMarker.rawValue, "ScootyMarker")
        checkStringValue(Identifier.scootyImage.rawValue, "Scooty")
        checkStringValue(Identifier.scootyAnnotation.rawValue, "ScootyAnnotation")
        checkStringValue(VehiclesEndPoint.getVehicles.rawValue, "/db")
        checkStringValue(VehiclesEndPoint.getVehicle.rawValue, "/vehicles/")
    }
    
    // MARK: - private tests

    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
