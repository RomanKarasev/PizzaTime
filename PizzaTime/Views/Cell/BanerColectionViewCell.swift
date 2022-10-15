//
//  BanerColectionViewCell.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 15.10.2022.
//

import Foundation
import UIKit

//MARK: - BanerCollectionViewCell

class BanerCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "BanerCollectionViewCell"
    
    let banerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setConstraints() {
        addSubview(banerImageView)
        NSLayoutConstraint.activate([banerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     banerImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
    }
}
