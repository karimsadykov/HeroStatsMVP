//
//  RolesCollectionViewCell.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

class RolesCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(14)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
