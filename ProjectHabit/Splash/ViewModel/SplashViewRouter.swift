//
//  SplashViewRouter.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 07/05/22.
//

import SwiftUI

enum SplashViewRouter{
    static func makeSingInView() -> some View{
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
