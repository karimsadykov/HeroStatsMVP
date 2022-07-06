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
//        getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        register(HeroCollextionViewCel.self, forCellWithReuseIdentifier: "cellI")
        showsVerticalScrollIndicator = false
//        delegate = self
//        dataSource = self
        backgroundColor = .clear
    }
    
//    func getData() {
//        let urlString = "https://api.opendota.com/api/herostats"
//        network.fetchTracks(urlString: urlString) { [weak self] result in
//            guard let result = result else { return }
//            self?.heroes = result
//            guard let roles = self?.heroes.compactMap({ $0.roles }).flatMap({ $0 }) else { return }
//            self?.roles = Array(Set(roles.map({ $0 })))
//            print(self?.heroes ?? 0)
//            self?.reloadData()
//
//        }
//    }
    
}

//extension tryView: UICollectionViewDataSource, UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return heroes.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellI", for: indexPath) as! HeroCollextionViewCel
//        let hero = heroes[indexPath.row]
//        cell.configureHeroCell(heros: hero)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailAlbumViewController = ViewController()
//        let hero = heroes[indexPath.row]
//        detailAlbumViewController.hero = hero
//        detailAlbumViewController.title = hero.localized_name
//
//    }
//
//}
//
//extension tryView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 170, height: 170)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
//    }
//}
