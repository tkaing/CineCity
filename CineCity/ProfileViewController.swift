//
//  ProfileViewController.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var labelEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.isTranslucent = false
        nav?.barStyle = UIBarStyle.black
        navigationItem.title = "Profil Utilisateur"
        let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textChangeColor
        self.labelEmail.text = UserUtils.user.email
    }

    @IBAction func pressLogout(_ sender: UIButton) {
        UserUtils.user = UserUtils.getModeNotLogged()
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
