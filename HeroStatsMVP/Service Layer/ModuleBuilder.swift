//
//  ModuleBuilder.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import Foundation

protocol Buildable {
    
    func buildMainModule() -> MainViewController
    func buildBookInfoModule(with properties : HeroStatsData) -> DetailViewController
    
}

class ModuleBuilder {
    
}
