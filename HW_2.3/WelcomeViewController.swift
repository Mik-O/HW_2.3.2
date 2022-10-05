//
//  WelcomeViewController.swift
//  HW_2.3
//
//  Created by Mishanya on 05.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var user: String!

    @IBOutlet var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = user
        
    }
    
}
