//
//  AdminFilmViewController.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class AdminFilmViewController: UIViewController {

    @IBOutlet var textTitle: UITextField!
    @IBOutlet var textReleaseDate: UITextField!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var imageViewFilm: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var filmCall: FilmCall {
        return FilmCallAPI()
    }
    
    func afterSave() {
        self.buttonSave.isUserInteractionEnabled = true
    }
    func beforeSave() {
        self.buttonSave.isUserInteractionEnabled = false
    }
    func formValidation() -> Bool {
        return textTitle.text != "" && textReleaseDate.text != ""
    }
    
    @IBAction func pressSave(_ sender: UIButton) {
        
        self.beforeSave()
        
        if formValidation() {
            
            let item: [String:Any] = [
                "id": -1,
                "title": textTitle.text as Any,
                "releaseDate": textReleaseDate.text as Any
            ]
            if let film = FilmUtils.map(item: item) {
                filmCall.save(object: film) { (film) in
                    if film != nil {
                        self.textTitle.text = ""
                        self.textReleaseDate.text = ""
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

extension AdminFilmViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        self.imageViewFilm.image = image
        //print(self.imageViewFilm.image?.toBase64())
        picker.dismiss(animated: true)
    }
}
