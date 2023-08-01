//
//  ThemeView.swift
//  HW1_1
//
//  Created by MacBook Pro on 01/08/23.
//

import UIKit
protocol ThemeViewDelegate: AnyObject {
    func updateColor()
}

final class ThemeView: UIView {
    weak var delegate: ThemeViewDelegate?
    private var button1: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = WhiteTheme().backgroundColor
        return button
    }()
    
    private var button2: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = BlueTheme().backgroundColor
        return button
    }()
    
    private var button3: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = GreenTheme().backgroundColor
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Theme.currentTheme.backgroundColor
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        setupConstraints()
    }
    private func setupConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.centerYAnchor.constraint(equalTo: centerYAnchor),
            button1.centerXAnchor.constraint(equalTo: centerXAnchor),
            button1.leftAnchor.constraint(equalTo: leftAnchor),
            button1.rightAnchor.constraint(equalTo: rightAnchor),
            
            button2.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -20),
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.leftAnchor.constraint(equalTo: leftAnchor),
            button2.rightAnchor.constraint(equalTo: rightAnchor),
            
            button3.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button3.centerXAnchor.constraint(equalTo: centerXAnchor),
            button3.leftAnchor.constraint(equalTo: leftAnchor),
            button3.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }}

private extension ThemeView {
    @objc func tap1() {
        Theme.currentTheme = WhiteTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
//        ThemeSaver.putData()
    }
    @objc func tap2() {
        Theme.currentTheme = BlueTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
//        ThemeSaver.putData()
    }
    
    @objc func tap3() {
        Theme.currentTheme = GreenTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
//        ThemeSaver.putData()
    }
}
