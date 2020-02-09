//
//  HomeViewController.swift
//  CineCity
//
//  Created by Viviana Montiel on 09/01/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var img_films: UIImageView!
    @IBOutlet var img_salles: UIImageView!
    @IBOutlet var img_seances: UIImageView!
    @IBOutlet var img_billets: UIImageView!
    @IBOutlet var affiche_button: UIButton!
    @IBOutlet var prochainement_button: UIButton!
    @IBOutlet var films_button: UIButton!
    @IBOutlet var events_button: UIButton!
    @IBOutlet var billets_button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
          nav?.isTranslucent = false
          nav?.barStyle = UIBarStyle.black
          navigationItem.title = "CinéCity"
          let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
          navigationController?.navigationBar.titleTextAttributes = textChangeColor
        
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(touchSearchButton)),
        ]
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(touchProfileButton))
        ]

    }
    
    @objc func touchSearchButton() {
        //let mapViewController = RestaurantMapViewController()
        //self.navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    @objc func touchProfileButton() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
        //let createViewController = RestaurantCreateViewController()
        //self.present(createViewController, animated: true)

    }
    
    @IBAction func touchAfficheButton() {
    }
    
    
    @IBAction func touchProchainementButton() {
    }
    
    @IBAction func touchFilmsButton() {
    }
    
    @IBAction func touchEventsButton() {
        let eventsViewController = EventsViewController()
        self.navigationController?.pushViewController(eventsViewController, animated: true)
    }
    
    @IBAction func touchBilletsButton() {
        
        let billetViewController = PastReservationsListViewController()
        self.navigationController?.pushViewController(billetViewController, animated: true)
    }
    /*let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.imgAction))

    ImageViewName.addGestureRecognizer(tap)
    
    @objc func imgAction(){

    // perform the action here
    }*/
    

        
        

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
