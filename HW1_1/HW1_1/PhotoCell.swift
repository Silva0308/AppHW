//
//  CustomCollectionViewCell.swift
//  HW1_1
//
//  Created by MacBook Pro on 13/07/23.
//

import UIKit

/// Class for Photo cell in collection view
final class PhotoCell: UICollectionViewCell {
    
    var tap: ((UIImage) -> Void)?
    private var imageView = UIImageView(image: UIImage(named:"logo"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Updating photo in cell
    /// - Parameter model: photo model
    func updateCell(model: Photo) {
        DispatchQueue.global().async {
            if let url = URL(string: model.sizes.first?.url ?? ""), let data = try?Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    private func setupViews() {
        addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
