//
//  CustomCell.swift
//  HW1_1
//
//  Created by MacBook Pro on 12/07/23.
//

import UIKit
class FriendCell: UITableViewCell{
    private var image : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "person")
            return image
        }()
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    private var label1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Name"
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(label1)
        contentView.addSubview(onlineCircle)
        myConstr()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateCell(model: Friend) {
        label1.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
        if let online = model.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
            }
        }
    }
    func myConstr(){
        image.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
           image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label1.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            label1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            onlineCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            onlineCircle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            onlineCircle.heightAnchor.constraint(equalToConstant: 40),
            onlineCircle.widthAnchor.constraint(equalTo: onlineCircle.heightAnchor)
        ])
        
    }
}
