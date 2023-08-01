//
//  TableViewController.swift
//  HW1_1
//
//  Created by MacBook Pro on 12/07/23.
//

import UIKit
class FriendsController : UITableViewController{
    private let networkService = NetworkService()
    private var models: [Friend] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //models = fileCache.fetchFriends()
        //tableView.reloadData()
        title = "Friends"
        view.backgroundColor = .white // Theme.currentTheme.backgroundColor
        tableView.backgroundColor = .white //// Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(tap))
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
//        refreshControl = UIRefreshControl
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
//        networkService.getFriends{ [weak self] friends in self?.models = friends
            DispatchQueue.main.async {
//                self?.tableView.reloadData()
            }
        }
    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
        return cell
    }


private extension FriendsController {
    @objc func tap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .moveIn
        animation.duration = 3
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileController(), animated: false) //добить в скобках!
    }
    
    @objc func update() {
        networkService.getFriends([weak self] result in switch result {
        case .success(let friends):
            self?.models = friends
            self?.fileCache.addFriends(friends: friends)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
}
