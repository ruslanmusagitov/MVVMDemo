//
//  PersonDetails.swift
//  MVVMDemo
//
//  Created by Ruslan Musagitov on 15/05/2019.
//  Copyright © 2019 Ruslan Musagitov. All rights reserved.
//

import UIKit

struct PersonDetails: Codable {
    var firstName : String?
    var lastName : String?
    var email : String?
    var password : String?
    var confirmPassword : String?
    var agreed : Bool
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case password
        case confirmPassword = "password_confirmation"
        case agreed = "terms_and_conditions"
    }
}
