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
    private var fileCache: FileCacheSpy!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkServiceSpy()
        fileCache = FileCacheSpy()
        friendsController = FriendsController()
    }
    
    override func tearDown() {
        friendsController = nil
        networkService = nil
        fileCache = nil
        super.tearDown()
    }
     
    func testGetFriends() {
        friendsController.getFriends()
        XCTAssertTrue(networkService.isGetFriendsWasCalled, "метод не вызван")
    }
    
}
