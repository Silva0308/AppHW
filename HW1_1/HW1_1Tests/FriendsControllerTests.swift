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
    
    override func setUp() {
        super.setUp()
        friendsController = FriendsController()
    }
    
    override func tearDown() {
        friendsController = nil
        super.tearDown()
    }
     
    func testGetFriends() {
        friendsController.getFriends()
    }
    
}
