//
//  SpaceXSearchTests.swift
//  SpaceXSearchTests
//
//  Created by Hafizullah Samim on 4/7/22.
//

import XCTest
@testable import SpaceXSearch

var pastFlightVc: PastFlightViewController!
var viewModel: FlightViewModel!
class SpaceXSearchTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        pastFlightVc = PastFlightViewController()
        viewModel = FlightViewModel()
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        pastFlightVc = nil
        viewModel = nil
    }
    
    func testLoadingFlightListWithNilSearchCariteria(){
        let expectation = expectation(description: "Default Search is not working, or timeout error")
        
        viewModel.getPastFlight(nil)
        viewModel.bindViewmodelToVc = {
            
            //check if the view model loaded the correct defult datas which is equal 30
            XCTAssertEqual(viewModel.flightsData.count, 30)
            
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: 15) { error in
            if let error = error {
              XCTFail("Error: \(error)")
            }
        }
       

    }
    
    func testLoadingFlightListWithLimitedData(){
        let expectation = expectation(description: "Limit Data is not true")
        var sc : SearchCariteria = SearchCariteria()
        sc.limit = 100
        viewModel.getPastFlight(sc)
        viewModel.bindViewmodelToVc = {
            
            //check if the view model loaded the correct defult datas which is equal 30
            XCTAssertLessThanOrEqual(viewModel.flightsData.count, sc.limit, "Data should be equal or lower than limit")
            
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: 15) { error in
            if let error = error {
              XCTFail("Error: \(error)")
            }
        }
       

    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
