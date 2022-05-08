//
//  SignInViewRouter.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 08/05/22.
//

import SwiftUI

enum SignInViewRouter{
    static func makeHomeView() -> some View{
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
