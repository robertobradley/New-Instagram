//
//  LoginViewController.swift
//  Instagram
//
//  Created by Roberto Bradley on 9/27/18.
//  Copyright © 2018 user144731. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
//--OUTLETS--//
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
//--VARIABLES--//
var currentUser = PFUser.current()
    
    
//-------------Visual Break----------//
    override func viewDidLoad() {
        super.viewDidLoad()
//        if currentUser != nil {
//            // Do stuff with the user
//            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        //}

        // Do any additional setup after loading the view.
    }
//--FUNCTIONS--//
    @IBAction func onSignIn(_ sender: Any)
    {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("you're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any)
    {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                if error._code == 202{
                    print("Username is already taken")
                }
                else{
               
                print(error.localizedDescription)
                
                }
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("User Registered successfully")
                // manually segue to logged in view
                
            }
        }
        
    }
    

}
