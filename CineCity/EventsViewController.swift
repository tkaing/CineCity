//
//  EventsViewController.swift
//  CineCity
//
//  Created by Dorian on 09/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavigation(title: "Évènements")
    }
    
    @IBAction func pressGoFilms(_ sender: UIButton) {
        FooterUtils.films(view: self)
    }
    @IBAction func pressGoEvents(_ sender: UIButton) {
        FooterUtils.events(view: self)
    }
    @IBAction func pressGoBillets(_ sender: UIButton) {
        FooterUtils.billets(view: self)
    }
}
