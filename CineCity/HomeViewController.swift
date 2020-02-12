//
//  HomeViewController.swift
//  CineCity
//
//  Created by Viviana Montiel on 09/01/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var buttonNow: UIButton!
    @IBOutlet var buttonSoon: UIButton!
    @IBOutlet var button_films: UIButton!
    @IBOutlet var button_events: UIButton!
    @IBOutlet var button_tickets: UIButton!
    @IBOutlet var collectionViewNow: UICollectionView!
    @IBOutlet var collectionViewUpcoming: UICollectionView!
    
    public static let collectionViewCellId = "cvc-films"
    
    var filmCall: FilmCall {
        return FilmCallAPI()
    }
    var filmsNow: [Film] = [] {
        didSet {
            self.collectionViewNow.reloadData()
        }
    }
    var filmsUpcoming: [Film] = [] {
        didSet {
            self.collectionViewUpcoming.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNavigation(title: "CinéCity")
        self.initCollectionView()
        self.initLocalizable()
        self.initRest()
        
        self.call()
        
        
    }
    
    private func initLocalizable() {
        buttonNow.setTitle(NSLocalizedString("outnow", comment: ""), for: .normal)
        buttonSoon.setTitle(NSLocalizedString("outsoon", comment: ""), for: .normal)
        button_films.setTitle(NSLocalizedString("films", comment: ""), for: .normal)
        button_events.setTitle(NSLocalizedString("events", comment: ""), for: .normal)
        button_tickets.setTitle(NSLocalizedString("tickets", comment: ""), for: .normal)
    }
    private func initCollectionView() {
        self.collectionViewNow.register(UINib(nibName: "FilmCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeViewController.collectionViewCellId)
        self.collectionViewNow.delegate = self
        self.collectionViewNow.dataSource = self
        
        self.collectionViewUpcoming.register(UINib(nibName: "FilmCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeViewController.collectionViewCellId)
        self.collectionViewUpcoming.delegate = self
        self.collectionViewUpcoming.dataSource = self
    }
    private func initRest() {
        self.buttonNow.setTitleColor(.systemBlue, for: .normal)
        self.collectionViewUpcoming.isHidden = true
    }
    private func call() {
        self.filmCall.all { (films) in
            self.filmsNow = FilmUtils.filterByNow(films: films)
            self.filmsUpcoming = FilmUtils.filterByUpcoming(films: films)
        }
    }
    
    @IBAction func pressNow(_ sender: UIButton) {
        self.buttonNow.setTitleColor(.systemBlue, for: .normal)
        self.buttonSoon.setTitleColor(.white, for: .normal)
        self.collectionViewNow.isHidden = false
        self.collectionViewUpcoming.isHidden = true
    }
    @IBAction func pressSoon(_ sender: UIButton) {
        self.buttonNow.setTitleColor(.white, for: .normal)
        self.buttonSoon.setTitleColor(.systemBlue, for: .normal)
        self.collectionViewNow.isHidden = true
        self.collectionViewUpcoming.isHidden = false
    }
   
    @IBAction func pressGoFilm(_ sender: UIButton) {
        FooterUtils.films(view: self)
    }
    @IBAction func pressGoEvent(_ sender: UIButton) {
        FooterUtils.events(view: self)
    }
    @IBAction func pressGoBillet(_ sender: UIButton) {
        FooterUtils.billets(view: self)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Redirect to Film Details
    }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionViewNow) {
            return self.filmsNow.count
        }
        if (collectionView == self.collectionViewUpcoming) {
            return self.filmsUpcoming.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionViewNow.dequeueReusableCell(withReuseIdentifier: HomeViewController.collectionViewCellId, for: indexPath) as! FilmCollectionViewCell
        //let film = self.filmsNow[indexPath.row]
        cell.layer.cornerRadius = 6
        //cell.imageViewFilm = UIImage()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2.06
        return CGSize(width: width, height: width + (width * 0.3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension UIViewController {
    
    func initNavigation(title: String) {
        
        let nav = self.navigationController?.navigationBar
        nav?.isTranslucent = false
        nav?.barStyle = UIBarStyle.black
        
        self.navigationItem.title = title
        
        let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textChangeColor
        
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.search)),
        ]
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(self.profile))
        ]
    }
    @objc func search() {
        
    }
    
    @objc func profile() {
        if UserUtils.user.email != "" {
            if UserUtils.user.email == UserUtils.getModeAdministrator().email { self.navigationController?.pushViewController(AdminLoginViewController(), animated: true)
            } else {
                self.navigationController?.pushViewController(ProfileViewController(), animated: true)
            }
        } else {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
}
