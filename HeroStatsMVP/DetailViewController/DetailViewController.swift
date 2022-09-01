//
//  DetailViewController.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

protocol DetailViewControllerProtocol {
    func display(properties: HeroStatsData)
}

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    
    private var heroImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "12")
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var attackTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private var baseHealthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private var baseManaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private var baseAtackMinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private var baseStrLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private var baseSpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(HeroCollextionViewCell.self, forCellWithReuseIdentifier: HeroCollextionViewCell.id)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        presenter.setHero()
       }
    
    func setup() {
        view.addSubview(heroImage)
        view.addSubview(nameLabel)
        view.addSubview(attackTypeLabel)
        view.addSubview(baseHealthLabel)
        view.addSubview(baseManaLabel)
        view.addSubview(baseAtackMinLabel)
        view.addSubview(baseStrLabel)
        view.addSubview(baseSpeedLabel)
//        view.addSubview(collectionView)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        NSLayoutConstraint.activate([
            
            heroImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            heroImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heroImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            heroImage.heightAnchor.constraint(equalToConstant: 188),
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            
            attackTypeLabel.topAnchor.constraint(equalTo: heroImage.bottomAnchor),
            attackTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            attackTypeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            attackTypeLabel.heightAnchor.constraint(equalToConstant: 60),
            
            baseHealthLabel.topAnchor.constraint(equalTo: attackTypeLabel.bottomAnchor),
            baseHealthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseHealthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseHealthLabel.heightAnchor.constraint(equalToConstant: 60),
            
            baseManaLabel.topAnchor.constraint(equalTo: baseHealthLabel.bottomAnchor),
            baseManaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseManaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseManaLabel.heightAnchor.constraint(equalToConstant: 60),
            
            baseAtackMinLabel.topAnchor.constraint(equalTo: baseManaLabel.bottomAnchor),
            baseAtackMinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseAtackMinLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseAtackMinLabel.heightAnchor.constraint(equalToConstant: 60),
            
            baseStrLabel.topAnchor.constraint(equalTo: baseAtackMinLabel.bottomAnchor),
            baseStrLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseStrLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseStrLabel.heightAnchor.constraint(equalToConstant: 60),
            
            baseSpeedLabel.topAnchor.constraint(equalTo: baseStrLabel.bottomAnchor),
            baseSpeedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseSpeedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseSpeedLabel.heightAnchor.constraint(equalToConstant: 60),
            
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
}

extension DetailViewController:DetailViewProtocol {
    func setHero(hero: HeroStatsData?) {
        print(hero)
        nameLabel.text = hero?.localized_name
        attackTypeLabel.text = "Atack type: \((hero?.attack_type)!)"
        baseHealthLabel.text = "Base health: \((hero?.base_health)!)"
        baseManaLabel.text = "Base mana: \((hero?.base_mana)!)"
        baseAtackMinLabel.text = "Base min Atack: \((hero?.base_attack_min)!)"
        baseStrLabel.text = "Base Strenght: \((hero?.base_str)!)"
        baseSpeedLabel.text = "Base Speed: \((hero?.move_speed)!)"

        let urlString = "https://api.opendota.com" + (hero?.img)!
        let url = URL(string: urlString)
        heroImage.sd_setImage(with: url)
    }
    
    
}

//extension DetailViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        randomHeroesArray.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idRandomHeroCollectionView, for: indexPath) as! RandomHeroCollectionViewCell
//        let heroModel = randomHeroesArray[indexPath.row]
//        cell.cellConfigure(model: heroModel)
//        return cell
//    }
//}
//
////MARK: - UICollectionViewDelegate
//
//extension DetailViewController: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        let heroModel = randomHeroesArray[indexPath.row]
//
//        let detailsHeroViewController = DetailsHeroViewController()
//        detailsHeroViewController.heroModel = heroModel
//        detailsHeroViewController.heroesArray = heroesArray
//        navigationController?.pushViewController(detailsHeroViewController, animated: true)
//    }
//}
//
////MARK: - UICollectionViewDelegateFlowLayout
//
//extension DetailViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: collectionView.frame.height,
//               height: collectionView.frame.height)
//    }
//}
