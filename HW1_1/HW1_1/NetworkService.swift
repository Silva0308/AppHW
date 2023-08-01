//
//  NetworkService.swift
//  HW1_1
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    static var token: String? = ""
    static var userId: String? = ""
    
    func getFriends(completion: @escaping(Result<[Friend], Error>) -> Void)
    {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50,online&access_token=" + (NetworkService.token ?? "") + "&v=5.131")
        else {
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(Error.self as! Error))
                return
            }
            if let error = error{
                completion(.failure(error))
                return
            }
            do{
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                completion(.success(friends.response.items))
//                print(friends) //выводим в консоль
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    func getGroups(completion: @escaping (([Group]) -> Void)) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=" + (NetworkService.token ?? "") + "&fields=description&v=5.131&extended=1") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                completion(groups.response.items)
                print (groups)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos(completion: @escaping(([Photo]) -> Void)) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=" + (NetworkService.token ?? "") + "&v=5.131&album_id=profile") else {
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                completion(photos.response.items)
            }
            catch {
                print(error)
            }
        }.resume() //обязательно, иначе не заработает
    }
    
    func getProfileInfo(completion: @escaping(User?) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/users.get?fields=photo_400_orig&access_token=" + (NetworkService.token ?? "") + "&v=5.131") else {
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let user = try JSONDecoder().decode(UserModel.self, from: data)
                completion(user.response.first)
            }
            catch {
                print(error)
            }
        }.resume() //обязательно, иначе не заработает
    }
}
