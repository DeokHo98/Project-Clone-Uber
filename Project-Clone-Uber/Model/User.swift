//
//  User.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/03/17.
//

import Foundation

struct User {
    let fullName: String
    let email: String
    let accountType: Int
    
    init(dic: [String: Any]) {
        self.fullName = dic["name"] as? String ?? ""
        self.email = dic["email"] as? String ?? ""
        self.accountType = dic["accountType"] as? Int ?? 0
    }
}
