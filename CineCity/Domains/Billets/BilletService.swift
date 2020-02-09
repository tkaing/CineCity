//
//  BilletService.swift
//  CineCity
//
//  Created by Viviana Montiel on 24/01/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

protocol BilletService {
    
    func getAll(completion: @escaping ([Billet]) -> Void)
    func getById(_ id: String, completion: @escaping (Billet?) -> Void)
    func create(film: String, time: String, date: String, completion: @escaping (Bool) -> Void)
}

