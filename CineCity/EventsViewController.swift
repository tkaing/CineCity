//
//  EventsViewController.swift
//  CineCity
//
//  Created by Dorian on 09/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet var button_films: UIButton!
    @IBOutlet var button_events: UIButton!
    @IBOutlet var button_tickets: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavigation(title: "Évènements")
        
        button_films.setTitle(NSLocalizedString("films", comment: ""), for: .normal)
        button_events.setTitle(NSLocalizedString("events", comment: ""), for: .normal)
        button_tickets.setTitle(NSLocalizedString("tickets", comment: ""), for: .normal)
        
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
