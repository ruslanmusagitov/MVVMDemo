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
        
        setGradientBackground()
        setNavigationBarAppearance()
        
        title = "Personal Details"
    }

    private func setGradientBackground() {
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = view.frame.size
        gradientLayer.colors =
            [UIColor.App.gradientBlueBottom.cgColor, UIColor.App.gradientBlueTop.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setNavigationBarAppearance() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back")
        navigationController?.navigationBar.backItem?.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(customView: UIImageView(image: #imageLiteral(resourceName: "back")))
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
