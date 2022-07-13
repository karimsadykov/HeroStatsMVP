//
//  HeroRolesCollection.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

class HeroRolesCollection: UICollectionView{
    

    //MARK: - life cycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        register(RolesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
    }
    
}
