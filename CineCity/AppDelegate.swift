//
//  AppDelegate.swift
//  CineCity
//
//  Created by Thierry Kg on 20/12/2019.
//  Copyright © 2019 Vtd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow(frame: UIScreen.main.bounds)
    //window.rootViewController = UINavigationController(rootViewController: BilletsListViewController())
    //window.rootViewController = UINavigationController(rootViewController: PastReservationsListViewController())
    //window.rootViewController = UINavigationController(rootViewController: LoginViewController())
    //window.rootViewController = UINavigationController(rootViewController: SignUpViewController())
    window.rootViewController = UINavigationController(rootViewController: HomeViewController())
    window.makeKeyAndVisible()
    self.window = window
    
    return true
}


}

