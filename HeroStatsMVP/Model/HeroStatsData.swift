//
//  HeroStatsData.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import Foundation

struct HeroStatsData: Decodable, Equatable {
    let id: Int
    let name: String
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let roles: [String]
    let img: String?
    let icon: String
    let base_health: Int?
    let base_mana: Int?
    let base_armor: Double?
    let base_attack_min: Int?
    let base_attack_max: Int?
    let base_str : Int
    let move_speed: Int?
}
