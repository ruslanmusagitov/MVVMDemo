//
//  PersonDetailsViewController.swift
//  MVVMDemo
//
//  Created by Ruslan Musagitov on 15/05/2019.
//  Copyright © 2019 Ruslan Musagitov. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    private (set) var viewModel : PersonDetailsViewModel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var agreedButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.borderColor = UIColor.white.cgColor
        nextButton.layer.borderWidth = 1
        nextButton.layer.cornerRadius = nextButton.frame.size.height / 2
        nextButton.layer.masksToBounds = true
        
        setGradientBackground()
        setNavigationBarAppearance()
        updateView()
        
        title = "Personal Details"
    }
    
    func setViewModel(viewModel: PersonDetailsViewModel) {
        self.viewModel = viewModel
        updateView()
    }
    
    private func updateView() {
        guard isViewLoaded else { return }
        
        firstNameTextField.text = viewModel.firstName
        lastNameTextField.text = viewModel.lastName
        emailTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
        confirmPasswordTextField.text = viewModel.confirmPassword
        agreedButton.isSelected = viewModel.agreed
        
        nextButton.isEnabled = viewModel.isValid
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
    
    func updateModel() {
        viewModel.firstName = firstNameTextField.text
        viewModel.lastName = lastNameTextField.text
        viewModel.email = emailTextField.text
        viewModel.password = passwordTextField.text
        viewModel.confirmPassword = confirmPasswordTextField.text
        viewModel.agreed = agreedButton.isSelected
        
        updateView()
        print(viewModel.isValid)
    }
    
    @IBAction func controlValueChanged(_ sender: Any) {
        if let btn = sender as? UIButton, btn == agreedButton {
            agreedButton.isSelected = !agreedButton.isSelected
        }
        updateModel()
    }
    
    @IBAction func nextSelected() {
        
    }
}
