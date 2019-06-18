//
//  Flash_TestCustomMapView.swift
//  Flash_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 18/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain  All rights reserved.
//

import UIKit
import XCTest
import MapKit
@testable import Flash_Assignment

class Flash_TestCustomMapView: XCTestCase {
    let customMapView = CustomMapView()
    
    func testCustomMapView() {
        customMapView.configure()
        customMapView.centerOnCoordinate(centerCoodinate: CLLocationCoordinate2D(latitude:  AppConstants.userCoordinate.latitude, longitude: AppConstants.userCoordinate.longitude))
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.checkIntValue(Int(self.customMapView.mapType.rawValue), Int(MKMapType.mutedStandard.rawValue))
            self.checkIntValue(Int(self.customMapView.mapType.rawValue), Int(MKMapType.mutedStandard.rawValue))
            self.checkDoubleValue(self.customMapView.centerCoordinate.latitude, AppConstants.userCoordinate.latitude)
            self.checkDoubleValue(self.customMapView.centerCoordinate.longitude, AppConstants.userCoordinate.longitude)
            self.checkDoubleValue(self.customMapView.camera.altitude, AppConstants.eyeAltitude)
            self.checkDoubleValue(self.customMapView.region.span.latitudeDelta, AppConstants.latitudeAndLongitudinalDelta)
            self.checkDoubleValue(self.customMapView.region.span.longitudeDelta, AppConstants.latitudeAndLongitudinalDelta)
        }
    }
    
    // MARK: - private tests
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }

    private func checkDoubleValue(_ value: Double,  _ actualVal: Double) {
        XCTAssertEqual(value, actualVal)
    }
}
