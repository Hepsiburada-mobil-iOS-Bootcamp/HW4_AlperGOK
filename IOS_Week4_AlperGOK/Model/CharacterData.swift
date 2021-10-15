//
//  CharacterStats.swift
//  IOS_Week4_AlperGOK
//
//  Created by Alper Gok on 12.10.2021.
//

import UIKit

//Codable Struct for API match
struct CharacterData: Codable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let roles: [String]
    let img: String
    let icon: String
}


