//
//  FooterUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class FooterUtils {
    
    static func films(view: UIViewController) {
        view.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    static func events(view: UIViewController) {
        view.navigationController?.pushViewController(EventsViewController(), animated: true)
    }
    static func billets(view: UIViewController) {
        view.navigationController?.pushViewController(PastReservationsListViewController(), animated: true)
    }
}
