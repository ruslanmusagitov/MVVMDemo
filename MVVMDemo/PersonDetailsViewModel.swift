//
//  PersonDetailsViewModel.swift
//  MVVMDemo
//
//  Created by Ruslan Musagitov on 15/05/2019.
//  Copyright © 2019 Ruslan Musagitov. All rights reserved.
//

import Foundation

struct PersonDetailsViewModel {
    var firstName : String?
    var lastName : String?
    var email : String?
    var password : String?
    var confirmPassword : String?
    var agreed : Bool

    var isValid : Bool {
        guard let fn = firstName, let ln = lastName, let em = email, let pw = password, let cfPw = confirmPassword else { return false }
         return
        fn.count > 0 &&
        ln.count > 0 &&
        em.count > 0 &&
        pw.count > 0 &&
        cfPw.count > 0 &&
        agreed == true
    }
}
