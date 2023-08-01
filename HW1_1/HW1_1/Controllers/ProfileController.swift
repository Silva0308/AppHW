//
//  ProfileController.swift
//  HW1_1
//
//  Created by MacBook Pro on 26/07/23.
//

import UIKit
    class ProfileController: UIViewController {
    
    private var networkService = NetworkService()
    private var profileImageView = UIImageView()
    
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .gray
        label.textColor = .blue
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
            networkService.getProfileInfo{ [weak self] user in self?.updateData(model: user)}
    }
    
    func updateData(model: User?) {
        guard let model = model else {return}
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.main.async {
            self.nameLabel.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
        }
    }
    
    private func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        setupConstrains()
    }
    
    private func setupConstrains() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor)
        ])
    }
}

