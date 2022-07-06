//
//  HeroCollextionViewCel.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

class HeroCollextionViewCel: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        addSubview(imageView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    func configureHeroCell(heros: HeroStatsData) {
        
//        let urlString = "https://api.opendota.com" + (heros.img!)
//
//            NetworkService.shared.r`equest(urlString: urlString) { result in
//                switch result {
//                case .success(let data):
//                    let image = UIImage(data: data)
//                    self.imageView.image = image
//                case .failure(let error):
//                    self.imageView.image = nil
//                    print("No album logo" + error.localizedDescription)
//                }
//            }
       
       
        
//        if let url = URL(string: "https://api.opendota.com" + (heros.img!)) {
//            imageView.downloaded(from: url)
//        }
//        else {
//            imageView.image = nil
//        }
        let urlString = "https://api.opendota.com" + (heros.img)!
        let url = URL(string: urlString)
        imageView.downloaded(from: url!)
        
        label.text = heros.localized_name
    }
    
    
    
}
