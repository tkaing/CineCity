//
//  EventsViewController.swift
//  CineCity
//
//  Created by Dorian on 09/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public static let eventsTableViewCellId = "etvc"

    @IBOutlet var eventsTableView: UITableView!
    @IBOutlet var button_films: UIButton!
    @IBOutlet var button_events: UIButton!
    @IBOutlet var button_tickets: UIButton!
    
    var events: [Event] = [] {
        didSet {
            self.eventsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavigation(title: "Évènements")
        
        button_films.setTitle(NSLocalizedString("films", comment: ""), for: .normal)
        button_events.setTitle(NSLocalizedString("events", comment: ""), for: .normal)
        button_tickets.setTitle(NSLocalizedString("tickets", comment: ""), for: .normal)
        
        self.eventsTableView.rowHeight = 120
        self.eventsTableView.backgroundColor = UIColor.clear
        self.eventsTableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: EventsViewController.eventsTableViewCellId)
        self.eventsTableView.dataSource = self
        self.eventsTableView.delegate = self
        
        self.eventsService.all { (events) in
            self.events = events
        }   
    }
    
    var eventsService: EventCall {
        //return BilletsMockService()
        return EventCallAPI()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventsViewController.eventsTableViewCellId, for: indexPath) as! EventTableViewCell
        let event = self.events[indexPath.row]
        cell.nameEvent.text = event.title
        cell.dateEvent.text = DateUtils.toString(date: Date())
        return cell
    }
}
