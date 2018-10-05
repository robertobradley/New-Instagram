//
//  DetailViewController.swift
//  New-Instagram
//
//  Created by Roberto Bradley on 10/4/18.
//  Copyright © 2018 rbradley. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    
    var post: PFObject!
    var postImage : UIImage!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.image = postImage
        self.timeStampLabel.text = post["timestamp"] as? String
        self.captionLabel.text = post["caption"] as? String        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
