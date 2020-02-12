//
//  LoginViewController.swift
//  Project
//
//  Created by Viviana Montiel on 05/02/2020.
//  Copyright © 2020 Viviana Montiel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var label_username: UILabel!
    @IBOutlet var label_password: UILabel!
    @IBOutlet var textfield_username: UITextField!
    @IBOutlet var textfield_password: UITextField!
    @IBOutlet var btn_login: UIButton!
    @IBOutlet var signUp_button: UIButton!
    
    var userCall: UserCall {
        return UserCallAPI()
    }
    
    @IBAction func press_login(_ sender: Any) {
        guard
            let USERNAME = self.textfield_username.text,
            let PASSWORD = self.textfield_password.text
        else { return }
        
        if self.formValidation(username: USERNAME, password: PASSWORD) {
          
            self.btn_login.isUserInteractionEnabled = false
          
            self.userCall.all { (users) in
                // User (Normal)
                for user in users {
                    if user.email == USERNAME && user.password == PASSWORD {
                        UserUtils.user = user
                        self.navigationController?.pushViewController(HomeViewController(), animated: true)
                    }
                }
                // User (Administrator)
                let admin = UserUtils.getModeAdministrator()
                if admin.email == USERNAME && admin.password == PASSWORD {
                    UserUtils.user = admin
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)
                }
                self.btn_login.isUserInteractionEnabled = true
            }
           
        } else {
            self.alert(title: "Login failed!", message: "The form is not valid!")
        }
    }
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()

        label_username.text = NSLocalizedString("username", comment: "")
        label_password.text = NSLocalizedString("password", comment: "")
        btn_login.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
        
        let nav = self.navigationController?.navigationBar
          nav?.isTranslucent = false
          nav?.barStyle = UIBarStyle.black
          let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
          navigationController?.navigationBar.titleTextAttributes = textChangeColor
    }
    
    @IBAction func touchAdminButton() {
        let adminLoginViewController = AdminLoginViewController()
        self.navigationController?.pushViewController(adminLoginViewController, animated: true)
    }

    @IBAction func touchSignUpButton() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
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
extension LoginViewController {
    
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
extension LoginViewController {
    
    func initView() {
        // ST Menu
        //self.initPanel()
        self.navigationItem.title = "Login"
    }
}
