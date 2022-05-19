//
//  SignUpResponse.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 19/05/22.
//

import Foundation
struct SignUpResponse: Decodable{
    
    let detail: String?

    
    enum CodingKeys: String, CodingKey {
        case detail
   
    }
}
