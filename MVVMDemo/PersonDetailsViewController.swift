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
            [UIColor.App.gradientBlueBottom.cgColor, UIColor.App.gradientBlueTop.cgColor]
        //Use diffrent colors
        view.layer.addSublayer(gradientLayer)
    
    }
}
