//
//  Flash_TestVehiclesViewModel.swift
//  Flash_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 18/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain  All rights reserved.
//

import XCTest

@testable import Flash_Assignment

class Flash_TestVehiclesViewModel: XCTestCase {
    var viewModel: VehiclesViewModel?
    
    func testViewModel() {
        viewModel = VehiclesViewModel()
        
        if let path = Bundle.main.path(forResource: "vehicles.json", ofType: "") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    guard let dataItem = ItemsObjectList(json: jsonResult) as ItemsObjectList? else { return }
                    XCTAssertEqual(viewModel!.dataItem!, dataItem)
                }
            } catch let error {
                // handle error
                print("Error : \(error.localizedDescription)")
            }
        }
    }
    
}
