//
//  Flash_TestUtilityFunctions.swift
//  Flash_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 18/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain  All rights reserved.
//

import XCTest

@testable import Flash_Assignment

class Flash_TestUtilityFunctions: XCTestCase {

    func testUtilityFunction() {
       testFormateDate()
        
        testConvertLatLongToAddress()
    }
    
    func testFormateDate() {
        let timestampLabelString = "2019-03-11T09:31:56Z"
        let value = UtilityFunctions.shared.formatDate(dateString: timestampLabelString)
        checkStringValue(value, "Mar 11, 2019")
    }
    
    func testConvertLatLongToAddress() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UtilityFunctions.shared.convertLatLongToAddress(latitude: 52.529077,
                                                            longitude: 13.416351) { addressString in
            self.checkStringValue("Swinemünder Straße", addressString)
            }
        }
    }
    
    // MARK: - private tests
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }

}
