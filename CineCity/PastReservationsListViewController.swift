//
//  PastReservationsListViewController.swift
//  CineCity
//
//  Created by Fabiana Montiel on 07/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class PastReservationsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    public static let ReservationsTableViewCellId = "prtvc"
    @IBOutlet var reservationsList: UITableView!
    @IBOutlet var button_past: UIButton!
    @IBOutlet var button_upcoming: UIButton!
    
    var reservations: [Billet] = [] {
        didSet {
            self.reservationsList.reloadData()
        }
    }
    
    @IBAction func touch_past(_ sender: Any) {
    }
    
    @IBAction func touch_upcoming(_ sender: Any) {
    }
    
    var billetsService: BilletCall {
           //return BilletsMockService()
           return BilletCallAPI()
    
    }
    var filmCall: FilmCall {
           //return BilletsMockService()
           return FilmCallAPI()
    
    }
    override func viewDidAppear(_ animated: Bool) {
        self.billetsService.all { (billets) in
            self.reservations = billets
            print(self.reservations)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PastReservationsListViewController.ReservationsTableViewCellId, for: indexPath) as! PastReservationsTableViewCell
        let billet = self.reservations[indexPath.row]
        cell.titleLabel.text = billet.film.title
        cell.dateLabel.text = "une date"
        cell.timeLabel.text = billet.time
        return cell
    }
    

    override func viewDidLoad() {
        self.reservationsList.rowHeight = 120
        self.reservationsList.backgroundColor = UIColor.clear
        self.reservationsList.register(UINib(nibName: "PastReservationsTableViewCell", bundle: nil), forCellReuseIdentifier: PastReservationsListViewController.ReservationsTableViewCellId)
        self.reservationsList.dataSource = self
        self.reservationsList.delegate = self
        button_past.setTitle(NSLocalizedString("past", comment: ""), for: .normal)
        button_upcoming.setTitle(NSLocalizedString("upcoming", comment: ""), for: .normal)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
