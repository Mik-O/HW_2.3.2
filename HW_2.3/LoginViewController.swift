//
//  ViewController.swift
//  HW_2.3
//
//  Created by Mishanya on 04.10.2022.
//

import UIKit

class LoginViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userName = segue.destination as? WelcomeViewController else { return }
        userName.userName = sender as? String
                
    }


}

