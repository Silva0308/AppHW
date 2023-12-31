//
//  GroupsModel.swift
//  HW1_1
//
//  Created by MacBook Pro on 19/07/23.
//

/// What is into group responce
struct GroupsModel: Decodable {
    var response: Groups
}
struct Groups: Decodable {
    var items: [Group]
}
struct Group: Codable {
    var id: Int
    var name: String?
    var photo: String?
    var description: String?
    
    /// how to decode
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_50"
        case description
    }
}
