//
//  SigInIUState.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 08/05/22.
//

import Foundation

enum SignInUIState : Equatable{
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
