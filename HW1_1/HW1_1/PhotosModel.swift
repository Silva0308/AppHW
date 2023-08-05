//
//  PhotosModel.swift
//  HW1_1
//
//  Created by MacBook Pro on 19/07/23.
//

/// What is into photo responce
struct PhotosModel: Decodable {
    var response: Photos
}
struct Photos: Decodable {
    var items: [Photo]
}
struct Photo: Decodable {
    var id: Int
    var text: String?
    var sizes: [Sizes]
}
struct Sizes: Codable {
    var url: String
}
