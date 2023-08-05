//
//  FileCacheSpy.swift
//  HW1_1
//
//  Created by MacBook Pro on 05/08/23.
//

import Foundation
@testable import HW1_1
final class FileCacheSpy: FileCacheProtocol{
    private(set) var isAddFriendsWasCalled = false
    private(set) var isFetchFriendsWasCalled = false
    private(set) var isFetchFriendDateWasCalled = false
    private(set) var isAddFriendDateWasCalled = false
    func addFriends(friends: [HW1_1.Friend]) {
        isAddFriendsWasCalled = true
    }
    
    func fetchFriends() -> [HW1_1.Friend] {
        isFetchFriendsWasCalled = true
        return []
    }
    
    func fetchFriendDate() -> Date? {
        isFetchFriendDateWasCalled = true
        return nil
    }
    
    func addFriendDate() {
        isAddFriendDateWasCalled = true
    }
    
    
}
