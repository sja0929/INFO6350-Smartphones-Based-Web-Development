//
//  ViewController.swift
//
//  CreatUser
//
//  Created by Jiaan Shi on 16/11/20.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad () {
        super.viewDidLoad ()
        // Do any additional setup after loading the view.
    }
    @IBAction func creat (_ sender: UIButton) {
        // Get email address and password from each TextField
        let email = mail.text!
        let password = pass.text!
        // Firebase SDK Login as a new user
        Auth.auth (). createUser (withEmail: email, password: password) {(result, error) in
            // If i can log in
            if (result? .user)! = nil {
                // Transition to the next screen
                self.performSegue (withIdentifier: "EmailViewController", sender: nil)
            }
        }
    }
}