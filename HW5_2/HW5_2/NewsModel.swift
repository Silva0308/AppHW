//
//  NewsModel.swift
//  HW5_2
//
//  Created by MacBook Pro on 01/08/23.
//
import Foundation

struct NewsModel: Decodable {
    var results: [News]
}

struct News: Decodable, Identifiable {
        var id: Int
        var date: Double
        var title: String
        enum CodingKeys: String, CodingKey {
            case id
            case date = "publication_date"
            case title
    }
}
