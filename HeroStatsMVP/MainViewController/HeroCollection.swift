//
//  HeroCollection.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

class HeroCollection: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        register(HeroCollextionViewCel.self, forCellWithReuseIdentifier: "cellI")
        showsVerticalScrollIndicator = false
        backgroundColor = .clear
    }
    
}

