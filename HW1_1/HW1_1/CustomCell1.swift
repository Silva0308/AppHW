//
//  CustomCell1.swift
//  HW1_1
//
//  Created by MacBook Pro on 12/07/23.
//

import UIKit
class CustomCell1: UITableViewCell{
    let circle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .red
        circle.layer.cornerRadius = 20
        return circle
    }()
    let label1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Name"
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        return label
    }()
    
    let label2: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           label.text = "Description"
           label.textAlignment = .center
           label.backgroundColor = .blue
           label.textColor = .white
           return label
       }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(circle)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        myConstr()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func myConstr(){
        circle.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            circle.heightAnchor.constraint(equalToConstant: 40),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label1.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 20),
            label1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            label2.leftAnchor.constraint(equalTo: label1.leftAnchor),
            label2.rightAnchor.constraint(equalTo: label1.rightAnchor),
            label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
}
