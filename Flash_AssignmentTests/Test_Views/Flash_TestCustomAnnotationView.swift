//
//  Flash_TestCustomAnnotationView.swift
//  Flash_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 18/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain  All rights reserved.
//

import UIKit
import XCTest
import MapKit
@testable import Flash_Assignment

class Flash_TestCustomAnnotationView: XCTestCase {
    var customAnnotation: CustomAnnotation?
    
    func testCustomAnnotationView() {
       customAnnotation = CustomAnnotation(coor: CLLocationCoordinate2D(latitude: AppConstants.userCoordinate.latitude, longitude: AppConstants.userCoordinate.longitude))
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
