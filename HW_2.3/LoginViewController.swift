//
//  ViewController.swift
//  HW_2.3
//
//  Created by Mishanya on 04.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Private properties
    private let user = "Name"
    private let password = "Password"
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let velcomeVC = segue.destination as! WelcomeViewController
        velcomeVC.user = user
    }
    
    //MARK: - IBAction
    @IBAction func loginPressed() {
        if userNameTextField.text !== user || passwordTextField.text !== password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                textField: passwordTextField
            )
            return
        }
        
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Oops!",
                  message: "You name is \(user) 😉")
    }
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Oops!",
                  message: "You password is \(password) 😉")
    }
    
    @IBAction override func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
}

    //MARK: - Alert controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in textField?.text = nil}
    
    alert.addAction(okAction)
    present(alert, animated: true)
}

    //MARK - Work with keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginPressed()
        }
        return true
    }
}

