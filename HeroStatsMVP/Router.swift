//
//  Router.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

protocol RouterMain {
    var navigationController:UINavigationController? {get set}
    var asamblyBuilder: AssemblyBuilderProtocol? { get set }
}


protocol RouterProtocol:RouterMain {
    func initialVC ()
    func showDeteil(hero:HeroStatsData?, _ selectRoles: [HeroStatsData]?)
}

class Router:RouterProtocol {
    
    
    var navigationController: UINavigationController?
    
    var asamblyBuilder: AssemblyBuilderProtocol?
    
    
    //DI
    init(navigation:UINavigationController, assemblyBuilder:AssemblyBuilderProtocol) {
        self.asamblyBuilder = assemblyBuilder
        self.navigationController = navigation
    }
    
    
    func initialVC() {
        if let navController = navigationController {
            guard let mainViewController = asamblyBuilder?.createMainModule(router: self) else {return }
            
            navController.viewControllers = [mainViewController]
        }
        
      
    }
    
    func showDeteil(hero: HeroStatsData?, _ selectRoles: [HeroStatsData]?) {
        if let navController = navigationController {
            guard let detailViewController = asamblyBuilder?.createDetailModule(hero: hero, selectRoles, router: self) else {return }
            navController.pushViewController(detailViewController, animated: true)
            
        }
    }

}
