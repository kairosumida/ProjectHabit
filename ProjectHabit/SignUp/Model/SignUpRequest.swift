//
//  SignUpRequest.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 15/05/22.
//

import Foundation

struct SignUpRequest: Encodable {
    
    let fullName: String
    let email: String
    let password: String
    let document: String
    let phone: String
    let birthday: String
    let gender: Int
    
    enum CodingKeys: String, CodingKey {
        case fullName = "name"
        case email
        case password
        case document
        case phone
        case birthday
        case gender
    }
    /*
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fullName, forKey: .fullName)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(document, forKey: .document)
        try container.encode(phone, forKey: .phone)
        try container.encode(birthday, forKey: .birthday)
        try container.encode(gender, forKey: .gender)
    }
     */
}

