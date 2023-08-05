//
//  FriendsModel.swift
//  HW1_1
//
//  Created by MacBook Pro on 19/07/23.
//
/// What is into friend responce
struct FriendsModel: Decodable {
    var response: Friends
}
struct Friends: Decodable {
    var items: [Friend]
}
struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?
    var online: Int?
    
    /// how to decode
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name" 
        case lastName = "last_name"
        case photo = "photo_400_orig"
        case online
    }
}
