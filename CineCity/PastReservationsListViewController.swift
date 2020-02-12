//
//  PastReservationsListViewController.swift
//  CineCity
//
//  Created by Viviana Montiel on 07/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class PastReservationsListViewController: UIViewController {
    
    @IBOutlet var button_past: UIButton!
    @IBOutlet var button_upcoming: UIButton!
    @IBOutlet var reservationsList: UITableView!
    @IBOutlet var button_films: UIButton!
    @IBOutlet var button_events: UIButton!
    @IBOutlet var button_tickets: UIButton!
    
    public static let reservationsTableViewCellId = "prtvc"
    
    var filmCall: FilmCall {
        return FilmCallAPI()
    }
    var billetsService: BilletCall {
        return BilletCallAPI()
    }
    var reservations: [Billet] = [] {
        didSet {
            self.reservationsList.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNavigation(title: "Billets")
        
        self.reservationsList.rowHeight = 120
        self.reservationsList.backgroundColor = UIColor.clear
        self.reservationsList.register(UINib(nibName: "PastReservationsTableViewCell", bundle: nil), forCellReuseIdentifier: PastReservationsListViewController.reservationsTableViewCellId)
        self.reservationsList.dataSource = self
        self.reservationsList.delegate = self
        
        button_past.setTitle(NSLocalizedString("past", comment: ""), for: .normal)
        button_upcoming.setTitle(NSLocalizedString("upcoming", comment: ""), for: .normal)
        button_films.setTitle(NSLocalizedString("films", comment: ""), for: .normal)
        button_events.setTitle(NSLocalizedString("events", comment: ""), for: .normal)
        button_tickets.setTitle(NSLocalizedString("tickets", comment: ""), for: .normal)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.billetsService.all { (billets) in
            self.reservations = BilletUtils.filterByUser(tickets: billets)
        }
    }
    
    @IBAction func touch_past(_ sender: Any) {
        self.button_past.setTitleColor(.systemBlue, for: .normal)
        self.button_upcoming.setTitleColor(.white, for: .normal)
    }
    @IBAction func touch_upcoming(_ sender: Any) {
        self.button_past.setTitleColor(.white, for: .normal)
        self.button_upcoming.setTitleColor(.systemBlue, for: .normal)
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

extension PastReservationsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PastReservationsListViewController.reservationsTableViewCellId, for: indexPath) as! PastReservationsTableViewCell
        let billet = self.reservations[indexPath.row]
        cell.titleLabel.text = billet.film.title
        cell.dateLabel.text = DateUtils.toString(date: billet.date)
        cell.timeLabel.text = billet.time
        return cell
    }
}
