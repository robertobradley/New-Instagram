//
//  mapPhotoViewController.swift
//  New-Instagram
//
//  Created by Roberto Bradley on 10/2/18.
//  Copyright © 2018 rbradley. All rights reserved.
//

import UIKit
import Parse
import Photos
import Toucan


class mapPhotoViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var imagePost: UIImageView!
    
    @IBOutlet weak var captionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedPhoto(tapGestureRecognizer:)))
        
        imagePost.isUserInteractionEnabled = true
        imagePost.addGestureRecognizer(tapGesture)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func tappedPhoto(tapGestureRecognizer: UITapGestureRecognizer){
        imagePickerHelper()
    }
     let vc = UIImagePickerController()
    
    func imagePickerHelper()
    {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined{
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                self.vc.allowsEditing = true
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        print("Camera is available 📸")
                        self.vc.sourceType = .camera
                        self.vc.sourceType = UIImagePickerController.SourceType.camera
                    } else {
                        print("Camera 🚫 available so we will use photo library instead")
                        //vc.sourceType = .photoLibrary
                        self.vc.sourceType = UIImagePickerController.SourceType.photoLibrary
                    }
                    self.present(self.vc, animated: true, completion: nil)

                }
                else{}
            })
        } else {
            self.vc.allowsEditing = true
            print("got here else")
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                print("Camera is available 📸")
                self.vc.sourceType = .camera
                self.vc.sourceType = UIImagePickerController.SourceType.camera
            } else {
                print("Camera 🚫 available so we will use photo library instead")
                //vc.sourceType = .photoLibrary
                self.vc.sourceType = UIImagePickerController.SourceType.photoLibrary
            }
            self.present(self.vc, animated: true, completion: nil)

        }
        
       
        
        
            }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Get the image captured by the UIImagePickerController
        guard let selectedImage = info[.originalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        let resizedImage = Toucan.Resize.resizeImage(selectedImage,size: CGSize(width:414, height:414))
        
            self.imagePost.image = resizedImage
            imagePost.contentMode = .scaleAspectFit
            
            dismiss(animated: true, completion: nil)
        
        // Do something with the images (based on your use case)Cannot subscript a value of type '[String : Any]' with an index of type 'UIImagePickerController.InfoKe
        
        // Dismiss UIImagePickerController to go back to your original view controller
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onPost(_ sender: Any) {
        Post.postUserImage(image: imagePost.image, withCaption: captionTextView.text){(success, error) in
            if success{
                print("post sucessful")
                self.performSegue(withIdentifier: "postSegue", sender: nil)
            }
            else if let e = error as NSError?{
                print (e.localizedDescription)
            }
        }
        
    }
    
}
