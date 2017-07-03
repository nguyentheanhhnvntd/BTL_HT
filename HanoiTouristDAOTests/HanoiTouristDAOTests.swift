//
//  HanoiTouristDAOTests.swift
//  HanoiTouristDAOTests
//
//  Created by Thế Anh Nguyễn on 7/3/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import XCTest
import UIKit
@testable import HanoiTourist

class HanoiTouristDAOTests: XCTestCase {
    
    let wrongMessage = "Some thing went wrong!"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFindClientByName(){
        let listClient = ClientDAO.init().findBy(name: "Nghi")
        assert(listClient.count == 1, wrongMessage)
    }
    
    func testFindClientByNameException(){
        let listClient = ClientDAO.init().findBy(name: "Long")
        assert(listClient.count == 0, wrongMessage)
    }
    
    func testFindSeasonTourByPlace() {
        let listTicket = SeasonTourDAO.init().findBy(startPlace: "Hanoi", endPlace: "Danang")
        assert(listTicket.count == 1, wrongMessage)
    }
    
    func testFindSeasonTourByPlaceWithShortPlaceName() {
        let listTicket = SeasonTourDAO.init().findBy(startPlace: "a", endPlace: "a")
        assert(listTicket.count == 6, wrongMessage)
    }
    
    func testFindClientWithShortName() {
        let listClient = ClientDAO.init().findBy(name: "a")
        assert(listClient.count == 2, "Some thing went wrong!")
    }
    
    func testFindSeasonTourByPlaceException() {
        let listTicket = SeasonTourDAO.init().findBy(startPlace: "Haiphong", endPlace: "V")
        assert(listTicket.count == 0, wrongMessage)
    }
    
    func testExample() {
        let listClient = ClientDAO.init().findBy(name: "Nghi")
        assert(listClient.count == 1, "Some thing went wrong!")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case. To measure the time of here.to measure the time of here.
        self.measure {
//            _ = SeasonTourDAO.init().findBy(startPlace: "Hanoi", endPlace: "Danang")
            _ = ClientDAO.init().findBy(name: "Nghi")
        }
    }
    
}
