//
//  Flash_TestConstants.swift
//  Flash-AssignmentTests
//
//  Created by Mohammad Zulqarnain on 17/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import XCTest
@testable import Flash_Assignment

class Flash_TestConstants: XCTestCase {
    
    func testConstants() {
        checkStringValue(AppConstants.protocolo, "https://")
        checkStringValue(AppConstants.domain, "my-json-server.typicode.com/FlashScooters/Challenge")
        checkStringValue(AppConstants.protocolo + AppConstants.domain, "https://my-json-server.typicode.com/FlashScooters/Challenge")
        checkStringValue(VehiclesEndPoint.getVehicles.rawValue, "/db")
        checkStringValue(VehiclesEndPoint.getVehicle.rawValue, "/vehicles/")
        
        checkStringValue(Vehicles.titleLabel.localized, "Name: ")
        checkStringValue(Vehicles.descriptionLabel.localized, "Description: ")
        checkStringValue(Vehicles.batteryLevel.localized, "Battery Level: ")
        checkStringValue(Vehicles.timestamp.localized, "Date: ")
        checkStringValue(Vehicles.addressLabel.localized, "Address: ")
        checkStringValue(Vehicles.priceLabel.localized, "Price: ")
        checkStringValue(Vehicles.priceTimeLabel.localized, "Price Time: ")
        checkIntValue( ResponseStatusCode.success.rawValue, 200)
    }
    
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
