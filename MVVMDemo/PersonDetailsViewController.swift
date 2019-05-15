//
//  PersonDetailsViewController.swift
//  MVVMDemo
//
//  Created by Ruslan Musagitov on 15/05/2019.
//  Copyright © 2019 Ruslan Musagitov. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = view.frame.size
        gradientLayer.colors =
            [UIColor(red: 91.0/255.0, green: 150/255.0, blue: 202.0/255, alpha: 1).cgColor, UIColor(red: 31.0/255.0, green: 109/255.0, blue: 182.0/255, alpha: 1).cgColor]
        //Use diffrent colors
        view.layer.addSublayer(gradientLayer)
    
    }
}


