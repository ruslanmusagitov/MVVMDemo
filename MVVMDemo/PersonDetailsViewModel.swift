//
//  PersonDetailsViewModel.swift
//  MVVMDemo
//
//  Created by Ruslan Musagitov on 15/05/2019.
//  Copyright © 2019 Ruslan Musagitov. All rights reserved.
//

import Foundation

protocol PersonDetailsViewModelDelegate: class {
    func personViewModelUserCreated(viewModel: PersonDetailsViewModel, with data: PersonData)
    func personViewModelUserCreateFailed(viewModel: PersonDetailsViewModel, with message: String)
}

struct PersonDetailsViewModel {
    weak var delegate: PersonDetailsViewModelDelegate?
    
    var personDetails: PersonDetails {
        let person = PersonDetails(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword, agreed: agreed)
        return person
    }
    
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
    
    init(with personDetails: PersonDetails) {
        firstName = personDetails.firstName
        lastName = personDetails.lastName
        email = personDetails.email
        password = personDetails.password
        confirmPassword = personDetails.confirmPassword
        agreed = personDetails.agreed
    }
    
    func next() {
        NetworkService.testRegistration(with: personDetails, completion: { (response, error) in
            if response?.status == true, let data = response?.data {
                self.delegate?.personViewModelUserCreated(viewModel: self, with: data)
            } else {
                self.delegate?.personViewModelUserCreateFailed(viewModel: self, with: error?.localizedDescription ?? "Unknown error")
            }
        })
    }

}
