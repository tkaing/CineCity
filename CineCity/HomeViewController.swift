//
//  HomeViewController.swift
//  CineCity
//
//  Created by Viviana Montiel on 09/01/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var buttonNow: UIButton!
    @IBOutlet var buttonSoon: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavigation(title: "CinéCity")
    }
    
    @IBAction func pressNow(_ sender: UIButton) {
        
    }
    @IBAction func pressSoon(_ sender: UIButton) {
        
    }
   
    @IBAction func pressGoFilm(_ sender: UIButton) {
        FooterUtils.films(view: self)
    }
    @IBAction func pressGoEvent(_ sender: UIButton) {
        FooterUtils.events(view: self)
    }
    @IBAction func pressGoBillet(_ sender: UIButton) {
        FooterUtils.billets(view: self)
    }
}

extension UIViewController {
    
    func initNavigation(title: String) {
        
        let nav = self.navigationController?.navigationBar
        nav?.isTranslucent = false
        nav?.barStyle = UIBarStyle.black
        
        self.navigationItem.title = title
        
        let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textChangeColor
        
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.search)),
        ]
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(self.profile))
        ]
    }
    @objc func search() {
        
    }
    
    @objc func profile() {
        if UserUtils.user.email != "" {
            if UserUtils.user.email == UserUtils.getModeAdministrator().email { self.navigationController?.pushViewController(AdminLoginViewController(), animated: true)
            } else {
                self.navigationController?.pushViewController(ProfileViewController(), animated: true)
            }
        } else {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
}
