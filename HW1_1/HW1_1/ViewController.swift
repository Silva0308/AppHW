//
//  ViewController.swift
//  HW1_1
//
//  Created by MacBook Pro on 08/07/23.
//

import UIKit

class ViewController: UIViewController {
    private let image: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let label: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "Авторизация"
            label.textAlignment = .center
            label.backgroundColor = .red
            label.textColor = .black
            return label
        }()
    private let field: UITextField = {
     let field = UITextField()
        field.text = "Логин"
        field.textAlignment = .center
        field.textColor = .cyan
        field.borderStyle = .roundedRect
        field.backgroundColor = .gray
        return field
    }()
    
    private let field2: UITextField = {
     let field = UITextField()
        field.text = "Пароль"
        field.textAlignment = .center
        field.textColor = .cyan
        field.borderStyle = .roundedRect
        field.backgroundColor = .gray
        return field
    }()
    
    private let button: UIButton = {
            let button = UIButton()
            button.setTitle("Войти", for: .normal)
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
            button.setTitleColor(.green, for: .highlighted)
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(field)
        view.addSubview(field2)
        view.addSubview(button)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        setConstraint()
    }
    
    private func setConstraint(){
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        field.translatesAutoresizingMaskIntoConstraints = false
        field2.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            image.heightAnchor.constraint(equalToConstant: view.frame.size.height/5),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.height/10),
            
            field.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            field.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            field.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            field.heightAnchor.constraint(equalToConstant: view.frame.size.height/10),
            
            field2.topAnchor.constraint(equalTo: field.bottomAnchor, constant: 5),
            field2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            field2.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            field2.heightAnchor.constraint(equalToConstant: view.frame.size.height/10),
            
            button.topAnchor.constraint(equalTo: field2.bottomAnchor, constant: 5),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            button.heightAnchor.constraint(equalToConstant: view.frame.size.height/8),
        ])
    }

    
    @objc func tap() {
  
               let tab1 = UINavigationController(rootViewController: FriendViewController())
               let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: UINavigationController(rootViewController: PhotoController(collectionViewLayout: UICollectionViewFlowLayout()))
)

           
               tab1.tabBarItem.title = "Friends"
               tab2.tabBarItem.title = "Groups"
               tab3.tabBarItem.title = "Photos"

            
               let controllers = [tab1, tab2, tab3]

               let tabBarController = UITabBarController()
               tabBarController.viewControllers = controllers
               
               guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                     let firstWindow = firstScene.windows.first else {
                   return
               }

               
               firstWindow.rootViewController =  tabBarController
        
    }
}

