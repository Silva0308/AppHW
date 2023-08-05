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
    
    func getFriends(completion: @escaping (Result<[HW1_1.Friend], Error>) -> Void) {
        isGetFriendsWasCalled = true
    }
    
    
}
