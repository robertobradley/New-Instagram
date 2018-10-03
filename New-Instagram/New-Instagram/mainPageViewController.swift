//
//  mainPageViewController.swift
//  New-Instagram
//
//  Created by user144731 on 10/2/18.
//  Copyright © 2018 rbradley. All rights reserved.
//

import UIKit
import Parse

class mainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signOutButtonTapped(_ sender: Any) {
        
        PFUser.logOut()
        var currentUser = PFUser.current()
        self.performSegue(withIdentifier: "logOutSegue", sender: nil)    }
    
    @IBAction func onTakePhoto(_ sender: Any) {
        self.performSegue(withIdentifier: "takePicture", sender: nil)
    }
    
}
