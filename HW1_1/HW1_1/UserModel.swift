//
//  UserModel.swift
//  HW1_1
//
//  Created by MacBook Pro on 01/08/23.
//

/// What is into user responce
struct UserModel: Decodable {
    var response: [User]
}
struct User: Decodable {
    var firstName: String?
    var lastName: String?
    var photo: String?
    
    /// how to decode
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_400_orig"
    }
}
