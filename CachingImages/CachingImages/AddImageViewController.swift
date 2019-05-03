//
//  AddImageViewController.swift
//  CachingImages
//
//  Created by Surendra on 03/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController {

    private let employee: Employee
    private(set) var imagePicker: UIImagePickerController?
    init(withEmployee employee: Employee) {
        self.employee = employee
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.employee.name
    }

    @IBAction func addImageButtonTapped(_ sender: Any) {

        let chooseFromLibrary = UIAlertAction(title: "Choose from library", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                self.imagePicker = UIImagePickerController()
                self.imagePicker!.delegate = self
                self.imagePicker!.sourceType = .savedPhotosAlbum;
                self.imagePicker!.allowsEditing = false
                self.present(self.imagePicker!, animated: true, completion: nil)
            }
        }
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(chooseFromLibrary)
        self.present(alertController, animated: true, completion: nil)
        
    }
    

}

extension AddImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        if let pickedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
            ImageCache.shared.cacheImage(pickedImage, forKey: "\(self.employee.id)")
            self.imagePicker?.dismiss(animated: false, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
    }
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

