//
//  EventCall.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

protocol EventCall {
    
    func all(completion: @escaping ([Event]) -> Void)
    func one(_ id: Int, completion: @escaping (Event?) -> Void)
    func save(object: Event, completion: @escaping (Event?) -> Void)
    func update(_ id: Int, object: Event, completion: @escaping (Event?) -> Void)
    func delete(_ id: Int, completion: @escaping (Bool) -> Void)
}
