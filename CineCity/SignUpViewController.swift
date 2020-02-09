//
//  SignUpViewController.swift
//  CineCity
//
//  Created by Viviana Montiel on 07/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var label_username: UILabel!
    @IBOutlet var label_password: UILabel!
    @IBOutlet var textfield_username: UITextField!
    @IBOutlet var textfield_password: UITextField!
    @IBOutlet var button_submit: UIButton!
    
    @IBAction func touch_submit(_ sender: Any) {
        guard
            let USERNAME = self.textfield_username.text,
            let PASSWORD = self.textfield_password.text
            else { return }
        
        if self.formValidation(username: USERNAME, password: PASSWORD) {
            //let USER = User(username: USERNAME, password: PASSWORD)
            //let lo = Loading()
            //self.redirectTo(from: self, to: lo)
            /*UserService.default.create(user: USER) { (status) in
                let to = SignUp()
                self.redirectTo(from: lo, to: to)
                if status == 200 {
                    self.alert(title: "Login succeeded!", message: "Thanks! Your account has been registered")
                } else {
                    self.alert(title: "There was a problem...", message: "Oops ! Your account couldn't be registered!")
                }
            }*/
        } else {
            self.alert(title: "Register failed", message: "The form is not valid!")
        }
    }
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        
        label_username.text = NSLocalizedString("username", comment: "")
        label_password.text = NSLocalizedString("password", comment: "")
        button_submit.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
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

// Form Extension
extension SignUpViewController {
    
    func formValidation(username: String, password: String) -> Bool {
        
        return username != "" && password != ""
    }
    
    func alert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

// Front Extension
extension SignUpViewController {
    
    func initView() {
        
        // ST Menu
        //self.initPanel()
        self.navigationItem.title = "Sign Up"
    }
}
