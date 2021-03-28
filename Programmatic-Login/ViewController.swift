//
//  ViewController.swift
//  Programmatic-Login
//
//  Created by Brett Markowitz on 12/18/20.
//

import UIKit

class ViewController: UIViewController {
    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    var correctUsername = "user1"
    var correctPassword = "testpassword"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        configureUsernameTextField()
        configurePasswordTextField()
        configureLoginButton()
    }
    
    private func configureUsernameTextField() {
        //1. Initialize our view
        usernameTextField = UITextField()
        
        //2. Set the translatesAutoresizingMaskIntoConstraints property to false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //3. Set any additional properties to customize our view
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "Username"
        usernameTextField.textContentType = .username
        
        //4. Add the view to the view controller's view
        view.addSubview(usernameTextField)
        
        //5. Activate the constraints to lay out our view
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])
    }
    
    private func configurePasswordTextField() {
        //1. Initialize our view
        passwordTextField = UITextField()
        
        //2. Set the translatesAutoresizingMaskIntoConstraints property to false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //3. Set any additional properties to customize our view
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.textContentType = .password
        
        //4. Add the view to the view controller's view
        view.addSubview(passwordTextField)
        
        //5. Activate the constraints to lay out our view
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])
    }
    
    private func configureLoginButton() {
        //1. Initialize our view
        loginButton = UIButton(type: .system)
        
        //2. Set the translatesAutoresizingMaskIntoConstraints property to false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        //3. Set any additional properties to customize our view
        loginButton.setTitle("Log in", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        //4. Add the view to the view controller's view
        view.addSubview(loginButton)
        
        //5. Activate the constraints to lay out our view
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func loginButtonPressed() {
        let typedUsername = usernameTextField.text
        let typedPassword = passwordTextField.text
        
        var alertTitle = ""
        var alertMessage = ""
        
        if typedUsername == correctUsername && typedPassword == correctPassword {
            // Credentials are correct
            alertTitle = "Success"
            alertMessage = "The credentials are correct."
        } else {
            // Credentials are incorrect
            alertTitle = "Error"
            alertMessage = "The credentials are incorrect."
        }
        
        // 1. Create the error alert
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        // 2. Create an "OK" action
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        
        // 3. Add the action to the alert
        alertController.addAction(okAction)
        
        // 4. Show the alert
        present(alertController, animated: true, completion: nil)
    }
}
