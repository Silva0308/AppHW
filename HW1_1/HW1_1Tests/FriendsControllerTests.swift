//
//  ProfileControllerTests.swift
//  HW1_1Tests
//
//  Created by MacBook Pro on 05/08/23.
//

import XCTest
@testable import HW1_1
final class FriendsControllerTests: XCTestCase {
    private var friendsController: FriendsController!
    private var networkService: NetworkServiceSpy!
    
    override func setUp() {
        super.setUp()
        friendsController = FriendsController()
        networkService = NetworkServiceSpy()
    }
    
    override func tearDown() {
        friendsController = nil
        networkService = nil
        super.tearDown()
    }
     
    func testGetFriends() {
        friendsController.getFriends()
        XCTAssertTrue(networkService.isGetFriendsWasCalled, "метод не вызван")
    }
    
}
