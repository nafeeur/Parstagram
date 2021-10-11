//
//  CameraViewController.swift
//  Parstagram
//
//  Created by Nafeeur on 10/10/21.
//

import UIKit
import Parse
import AlamofireImage

class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBOutlet weak var commentField: UITextField!
    
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        

        
        
    }
    
    
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    picker.sourceType = .camera
                } else {
                    picker.sourceType = .photoLibrary
                }
                present(picker, animated: true, completion: nil)
            }
            
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                var image = info[.editedImage] as! UIImage
                let size = CGSize(width: 300, height: 300)
                image = image.af_imageAspectScaled(toFill: size)
                imageView.image = image
                dismiss(animated: true, completion: nil)

        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
