//
//  FilmViewController.swift
//  CineCity
//
//  Created by Thierry Kg on 13/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    @IBOutlet var imageViewFilm: UIImageView!
    @IBOutlet var collectionViewSessions: UICollectionView!
    @IBOutlet var textSessions: UITextView!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var buttonReserve: UIButton!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelTime: UILabel!
    @IBOutlet var labelReleaseDate: UILabel!
    
    public static let collectionViewCellId = "cvc-sessions"
    
    var film: Film!
    var activeSession: String = "00:00"
    
    var billetCall: BilletCall {
        return BilletCallAPI()
    }
    var sessionCall: SessionCall {
        return SessionCallAPI()
    }
    var activeSessions: [Session] = [] {
        didSet {
            self.collectionViewSessions.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Film"
        let nav = self.navigationController?.navigationBar
        nav?.isTranslucent = false
        nav?.barStyle = UIBarStyle.black
        let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textChangeColor
        
        self.initCollectionView()
        self.initRest()
        self.call()
    }
    
    private func initCollectionView() {
        self.collectionViewSessions.register(UINib(nibName: "SessionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FilmViewController.collectionViewCellId)
        self.collectionViewSessions.delegate = self
        self.collectionViewSessions.dataSource = self
    }
    private func initRest() {
        //self.labelTime.text = self.film.time
        self.labelTitle.text = self.film.title
        self.labelReleaseDate.text = NSLocalizedString("outdate", comment: "") + DateUtils.toStringCustom(custom: "dd/MM/YYYY", date: self.film.releaseDate)
        self.imageViewFilm.image = self.film.image
        buttonSave.setTitle(NSLocalizedString("save", comment: ""), for: .normal)
        buttonReserve.setTitle(NSLocalizedString("reserve", comment: ""), for: .normal)
        if UserUtils.isLogged() {
            if UserUtils.isAdministrator() {
                self.buttonSave.isHidden = false
                self.buttonReserve.isHidden = true
                self.collectionViewSessions.isHidden = true
                self.textSessions.isHidden = false
            } else {
                self.buttonSave.isHidden = true
                self.buttonReserve.isHidden = false
                self.collectionViewSessions.isHidden = false
                self.textSessions.isHidden = true
            }
        } else {
            self.buttonSave.isHidden = true
            self.buttonReserve.isHidden = true
            self.collectionViewSessions.isHidden = true
            self.textSessions.isHidden = true
        }
        //self.buttonReserve.isUserInteractionEnabled = false
        self.buttonReserve.isEnabled = false
    }
    private func call() {
        self.sessionCall.all { (sessions) in
            self.activeSessions = SessionUtils.filterByFilm(sessions: sessions, film: self.film)
        }
    }

    @IBAction func pressSave(_ sender: UIButton) {
        
        self.buttonSave.isUserInteractionEnabled = false
        
        if textSessions.text != "" {
            
            let sessions = textSessions.text.split(separator: "-")
            
            for session in sessions {
                guard DateUtils.mapCustom(custom: "HH:mm", date: String(session)) != nil
                else { return }
                
                let item: [String:Any] = [
                    "id": -1,
                    "time": String(session) as Any,
                    "film": film.dictionnary() as Any
                ]
                if let session = SessionUtils.map(item: item) {
                    sessionCall.save(object: session) { (session) in
                        if session != nil {
                            self.alertCustom(title: "Succès", message: "Votre session a bien été ajouté.")
                        }
                    }
                }
            }
        } else {
            self.alertCustom(title: "Échec", message: "Votre ajout de session n'a pas pu aboutir.")
            self.buttonSave.isUserInteractionEnabled = true
        }
    }
    @IBAction func pressReserve(_ sender: UIButton) {
        
        self.buttonReserve.isUserInteractionEnabled = false
        
        let item: [String:Any] = [
            "id": -1,
            "time": activeSession as Any,
            "date": DateUtils.toString(date: Date()) as Any,
            "film": film.dictionnary() as Any,
            "user": UserUtils.user.dictionnary() as Any
        ]
        
        if let ticket = BilletUtils.map(item: item) {
            billetCall.save(object: ticket) { (ticket) in
                if ticket != nil {
                    self.alertCustom(title: "Succès", message: "Votre réservation a bien été ajouté.")
                } else {
                    self.alertCustom(title: "Échec", message: "Votre réservation n'a pas pu aboutir.")
                }
                self.buttonReserve.isUserInteractionEnabled = true
            }
        }
    }
}

extension FilmViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionViewSessions.dequeueReusableCell(withReuseIdentifier: FilmViewController.collectionViewCellId, for: indexPath) as! SessionCollectionViewCell
        
        let session = self.activeSessions[indexPath.row]
        
        for c in collectionView.visibleCells {
            guard let cc = c as? SessionCollectionViewCell else { return }
            cc.labelTime.textColor = .black
        }

        cell.labelTime.textColor = .systemBlue
        self.activeSession = session.time
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.activeSessions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionViewSessions.dequeueReusableCell(withReuseIdentifier: FilmViewController.collectionViewCellId, for: indexPath) as! SessionCollectionViewCell
        
        let session = self.activeSessions[indexPath.row]
        cell.labelTime.text = session.time
        cell.layer.cornerRadius = 6
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 4.06
        return CGSize(width: width, height: width - (width * 0.3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
