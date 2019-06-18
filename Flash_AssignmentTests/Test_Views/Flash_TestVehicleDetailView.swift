//
//  Flash_TestVehicleDetailView.swift
//  Flash_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 18/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain  All rights reserved.
//

import UIKit
import XCTest
@testable import Flash_Assignment

class Flash_TestVehicleDetailView: XCTestCase {
    let vehicleDetailView = VehicleDetailView()
    
    func testVehicleDetailView() {
       vehicleDetailView.populateValues(itemObject: ItemObject(id: 1, name: "000011", description: "Electric Scooter", latitude: 52.529077, longitude: 13.416351, batteryLevel: 98, timestamp: "2019-03-10T09:31:56Z", price: 15, priceTime: 60, currency: "€"))
        checkStringValue(vehicleDetailView.titleLabelString, "000011")
        checkStringValue(vehicleDetailView.descriptionLabelString, "Electric Scooter")
        checkStringValue(vehicleDetailView.batteryLevel, "98")
        checkStringValue(vehicleDetailView.priceLabelString, "€ 15.0")
        checkStringValue(vehicleDetailView.priceTimeLabelString, "60")
        checkStringValue(vehicleDetailView.timestampLabelString, "2019-03-10T09:31:56Z")
        
    }
    
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
