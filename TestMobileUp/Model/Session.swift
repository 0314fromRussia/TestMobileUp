//
//  Session.swift
//  TestMobileUp
//
//  Created by Никита Дмитриев on 17.08.2021.
//

import Foundation

class Session: CustomStringConvertible {
    
    static let shared = Session()
    private init() {}
    
    var token: String = ""
    var userId: Int = 0
    
    var description: String {
        return "id: \(userId), token: \(token)"
    }
    
}
