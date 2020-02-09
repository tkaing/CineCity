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
    
    
    @IBAction func press_login(_ sender: Any) {
        guard
            let USERNAME = self.textfield_username.text,
            let PASSWORD = self.textfield_password.text
            else { return }
        if self.formValidation(username: USERNAME, password: PASSWORD) {
            //let lo = Loading()
            //self.redirectTo(from: self, to: lo)
            let parameters = [
                "username": USERNAME,
                "password": PASSWORD
            ]
            /*UserService.default.authenticate(data: parameters) { (item) in
                if let user = item {
                    let to = Home()
                    self.redirectTo(from: lo, to: to)
                    ActiveManager.activeUser = user
                    self.alert(title: "Connexion réussie", message: "Bienvenue chez Augarde : \(user.username) !")
                } else {
                    let to = Login()
                    self.redirectTo(from: lo, to: to)
                    self.alert(title: "Échec lors de la connexion", message: "Oups ! Les identifiants semblent incorrect")
                }
            }*/
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
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(touchAdminButton))
        ]

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchAdminButton() {
        let adminLoginViewController = AdminLoginViewController()
        self.navigationController?.pushViewController(adminLoginViewController, animated: true)
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
