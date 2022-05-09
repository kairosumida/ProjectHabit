//
//  SignUpViewRouter.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 09/05/22.
//

import SwiftUI
enum SignUpViewRouter{
    static func makeHomeView() -> some View{
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
