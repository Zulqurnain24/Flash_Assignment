//
//  Flash_VehiclesViewControllerUITest.swift
//  Flash_AssignmentUITests
//
//  Created by Mohammad Zulqarnain on 18/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain All rights reserved.
//

import XCTest


import XCTest

class Flash_VehiclesViewControllerUITest: XCTestCase {
    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()

        continueAfterFailure = true
        
        app = XCUIApplication()

        app.launchArguments.append("--uitesting")
        
    }
    
    // MARK: - Tests
    
    //test swipe On map
    func testSwipeOnMap() {
        //launch app
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        let map = app.otherElements.matching(identifier: "mapView").element(boundBy: 0)
        map.pinch(withScale: 2, velocity: 1)
        map.rotate(CGFloat.pi/3, withVelocity: 1.0)
        map.swipeLeft()
        map.swipeRight()
        map.swipeDown()
        map.swipeDown()
        
    }
    
    //test tap on right button
    func testTapOnMapRightButton() {

        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        
        let rightButton = XCUIApplication().buttons["rightButton"]
        rightButton.tap()
        
    }
    
    //test tap on left button
    func testTapOnMapLeftButton() {
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        
        let leftButton = XCUIApplication().buttons["leftButton"]
        leftButton.tap()
        
    }
    
    //test tap on nearby button
    func testTapOnNearbyButton() {
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        
        let nearbyButton = XCUIApplication().buttons["nearbyButton"]
        nearbyButton.tap()
        
    }
    
    //test tap on map pin
    func testTapOnMapPin() {
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let pin = self.app.otherElements.matching(identifier: "ScootyAnnotation").element(boundBy: 0)
            XCTAssertTrue(pin.exists)
            pin.tap()
        }
    }
}

