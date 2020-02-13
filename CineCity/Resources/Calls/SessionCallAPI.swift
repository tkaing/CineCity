//
//  SessionCallAPI.swift
//  CineCity
//
//  Created by Thierry Kg on 13/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Alamofire

class SessionCallAPI: SessionCall {
    
    private let url: String = "http://tchooz.fr/session"
    
    func all(completion: @escaping ([Session]) -> Void) {
        Alamofire.request(self.url + "/all", method: .get).responseJSON { (request) in
            guard
                let items = request.value as? [[String:Any]]
            else {
                completion([])
                return
            }
            completion(items.compactMap(SessionUtils.map(item:)))
        }
    }
    
    func one(_ id: Int, completion: @escaping (Session?) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .get).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(SessionUtils.map(item: item))
        }
    }
    
    func save(object: Session, completion: @escaping (Session?) -> Void) {
        Alamofire.request(self.url, method: .post, parameters: object.dictionnary(), encoding: JSONEncoding.default).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(SessionUtils.map(item: item))
        }
    }
    
    func update(_ id: Int, object: Session, completion: @escaping (Session?) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .patch, parameters: object.dictionnary(), encoding: JSONEncoding.default).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(SessionUtils.map(item: item))
        }
    }
    
    func delete(_ id: Int, completion: @escaping (Bool) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .delete).responseJSON { (request) in
            completion(request.response?.statusCode == 200)
        }
    }
}
