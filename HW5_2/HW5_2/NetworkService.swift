//
//  NetworkService.swift
//  HW5_2
//
//  Created by MacBook Pro on 01/08/23.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    func getNews(completion: @escaping ([News]) -> ()) {
        guard let url = URL(string: "htts://kudago.com/piblic-api/v1.4/news/?fields=id,title,publication_date&text_format=text&actual_only=true") else{
            return
        }
        session.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do {
                let news = try
                JSONDecoder().decode(NewsModel.self, from: data)
                completion(news.result)
            } catch {
                print(error)
            }
        }.resume()
    }
}
