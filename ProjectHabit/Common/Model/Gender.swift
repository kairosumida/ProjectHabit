//
//  Gender.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 09/05/22.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable{
    case male = "Masculino"
    case female = "Feminino"
    
    var id : String {
        self.rawValue
    }
}
