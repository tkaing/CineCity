//
//  AdminEventViewController.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class AdminEventViewController: UIViewController {

    @IBOutlet var textTitle: UITextField!
    @IBOutlet var textCategory: UITextField!
    @IBOutlet var textDescription: UITextView!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var imageViewEvent: UIImageView!
    @IBOutlet var label_add_event: UILabel!
    @IBOutlet var button_choose_cover: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSave.setTitle(NSLocalizedString("save", comment: ""), for: .normal)
        button_choose_cover.setTitle(NSLocalizedString("choosecover", comment: ""), for: .normal)
        label_add_event.text = NSLocalizedString("addevent", comment: "")
        
    }
    
    var eventCall: EventCall {
        return EventCallAPI()
    }
    
    func afterSave() {
        self.buttonSave.isUserInteractionEnabled = true
    }
    func beforeSave() {
        self.buttonSave.isUserInteractionEnabled = false
    }
    func formValidation() -> Bool {
        return textTitle.text != "" && textCategory.text != "" && textDescription.text != ""
    }
    
    @IBAction func pressSave(_ sender: UIButton) {
        
        self.beforeSave()
        
        if formValidation() {
            
            let item: [String:Any] = [
                "id": -1,
                "title": textTitle.text as Any,
                "category": textCategory.text as Any,
                "description": textDescription.text as Any
            ]
            if let event = EventUtils.map(item: item) {
                eventCall.save(object: event) { (event) in
                    if event != nil {
                        self.textTitle.text = ""
                        self.textCategory.text = ""
                        self.textDescription.text = ""
                    }
                    self.afterSave()
                }
            } else {
                self.afterSave()
            }
        } else {
            self.afterSave()
        }
    }
    @IBAction func pressGallery(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
}

extension AdminEventViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        self.imageViewEvent.image = image
        picker.dismiss(animated: true)
    }
}
