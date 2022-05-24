//
//  SignInErrorResponse.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 24/05/22.
//

import Foundation

struct SignInErrorResponse: Decodable{
    
    let detail: SignInDetailErrorResponse

    
    enum CodingKeys: String, CodingKey {
        case detail
   
    }
}
struct SignInDetailErrorResponse: Decodable
{
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
