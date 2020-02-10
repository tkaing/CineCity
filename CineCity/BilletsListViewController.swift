//
//  BilletsListViewController.swift
//  Project
//
//  Created by Viviana Montiel on 05/02/2020.
//  Copyright © 2020 Viviana Montiel. All rights reserved.
//

import UIKit

class BilletsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    public static let BilletsTableViewCellId = "btvc"

    @IBOutlet var ticketsTableView: UITableView!
    @IBOutlet var btn_past: UIButton!
    @IBOutlet var btn_upcoming: UIButton!
    
    var billets: [Billet] = [] {
        didSet {
            self.ticketsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        self.ticketsTableView.rowHeight = 120
        self.ticketsTableView.backgroundColor = UIColor.clear
        self.ticketsTableView.register(UINib(nibName: "BilletsTableViewCell", bundle: nil), forCellReuseIdentifier: BilletsListViewController.BilletsTableViewCellId)
        self.ticketsTableView.dataSource = self
        self.ticketsTableView.delegate = self
        
        btn_past.setTitle(NSLocalizedString("past", comment: ""), for: .normal)
        btn_upcoming.setTitle(NSLocalizedString("upcoming", comment: ""), for: .normal)
        
        super.viewDidLoad()
        
        print("fdfsdfs")
        self.billetsService.all { (billets) in
            self.billets = billets
            print(self.billets)
        }
    }

    var billetsService: BilletCall {
        //return BilletsMockService()
        return BilletCallAPI()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        /*self.billetsService.all { (billets) in
            self.billets = billets
            print(self.billets)
        }*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.billets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BilletsListViewController.BilletsTableViewCellId, for: indexPath) as! BilletsTableViewCell
        let billet = self.billets[indexPath.row]
        cell.titleLabel.text = billet.film.title
        cell.dateLabel.text = DateUtils.toString(date: billet.date)
        cell.timeLabel.text = billet.time
        return cell
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
