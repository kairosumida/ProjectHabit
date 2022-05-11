//
//  SignUpUIState.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 09/05/22.
//

import Foundation
enum SignUpUIState: Equatable{
    case none
    case loading
    case success
    case error(String)
}
