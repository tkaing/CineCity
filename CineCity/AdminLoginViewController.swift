//
//  AdminLoginViewController.swift
//  CineCity
//
//  Created by Dorian on 09/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class AdminLoginViewController: UIViewController {

    @IBOutlet var labelEmail: UILabel!
    @IBOutlet var button_logout: UIButton!
    @IBOutlet var button_add_film: UIButton!
    @IBOutlet var button_add_event: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
          nav?.isTranslucent = false
          nav?.barStyle = UIBarStyle.black
          navigationItem.title = "Profil Administrateur"
          let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
          navigationController?.navigationBar.titleTextAttributes = textChangeColor
        
        button_logout.setTitle(NSLocalizedString("logout", comment: ""), for: .normal)
        button_add_film.setTitle(NSLocalizedString("addfilm", comment: ""), for: .normal)
        button_add_event.setTitle(NSLocalizedString("addevent", comment: ""), for: .normal)
    }

    
    @IBAction func pressCreateFilm(_ sender: UIButton) {
        present(AdminFilmViewController(), animated: true)
    }
    @IBAction func pressCreateEvent(_ sender: UIButton) {
        present(AdminEventViewController(), animated: true)
    }
    @IBAction func pressLogout(_ sender: UIButton) {
        UserUtils.user = UserUtils.getModeNotLogged()
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}

extension UIImage {
    func toBase64() -> String? {
        let data = self.pngData()
        guard let d = data else { return nil }
        return d.base64EncodedString()
    }
}
extension String {
    func toImage() -> UIImage? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return UIImage(data: data)
    }
}
