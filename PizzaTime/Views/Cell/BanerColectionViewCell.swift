//
//  BanerColectionViewCell.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 15.10.2022.
//

import Foundation
import UIKit

class BanerCollectionViewCell: UICollectionViewCell {
    
    let banerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(banerImageView)
        NSLayoutConstraint.activate([banerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     banerImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
    }
}
