//
//  _0181208_ChadMurdock_NYCSchoolsTests.swift
//  20181208-ChadMurdock-NYCSchoolsTests
//
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import XCTest
@testable import SimpleNetworking

class SimpleNetworkingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - Asynchronous Tests
    func testSectionComposition(){
        let tableViewModelTest = TableViewModel()
        let expectation = XCTestExpectation(description: "See that sections are composed correctly.")
        
        tableViewModelTest.setupSections(tableView: UITableView()) {
            XCTAssertEqual(tableViewModelTest.getSections().count, tableViewModelTest.getUniqueLetters().count, "Fault with section compositions.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testScoreClient(){
        let expectation = XCTestExpectation(description: "Fetch SAT scores.")
        ScoresClient.getScores { (score, error) in

            XCTAssertEqual(error, false, "Failed to fetch school's SAT scores.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        
    }
    
    func testSchoolList(){
        let expectation = XCTestExpectation(description: "Grab the school list to make sure it's not empty.")
        SchoolClient.getSchools { (schools) in
            XCTAssertGreaterThan(schools.count, 0, "The school list is empty.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    
    
}
