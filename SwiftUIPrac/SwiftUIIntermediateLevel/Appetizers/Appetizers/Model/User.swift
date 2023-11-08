//
//  User.swift
//  Appetizers
//
//  Created by SUCHAN CHANG on 2023/10/06.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
