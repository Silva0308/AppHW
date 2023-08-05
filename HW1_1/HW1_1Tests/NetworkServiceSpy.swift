//
//  NetworkServiceSpy.swift
//  HW1_1
//
//  Created by MacBook Pro on 05/08/23.
//

import Foundation
@testable import HW1_1
final class NetworkServiceSpy: NetworkServiceProtocol{
    private(set) var isGetFriendsWasCalled = false
    private(set) var isGetGroupsWasCalled = false
    private(set) var isGetPhotosWasCalled = false
    private(set) var isGetProfileInfoWasCalled = false

    func getFriends(completion: @escaping (Result<[HW1_1.Friend], Error>) -> Void) {
        isGetFriendsWasCalled = true
    }
    
    func getGroups(completion: @escaping (Result<[HW1_1.Group], Error>) -> Void) {
        isGetGroupsWasCalled = true
    }
    
    func getPhotos(completion: @escaping (([HW1_1.Photo]) -> Void)) {
        isGetPhotosWasCalled = true
    }
    
    func getProfileInfo(completion: @escaping (HW1_1.User?) -> Void) {
        isGetProfileInfoWasCalled = true
    }
    
    
}
