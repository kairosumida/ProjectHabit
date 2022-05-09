//
//  SignInViewRouter.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 08/05/22.
//

import SwiftUI
import Combine
enum SignInViewRouter{
    static func makeHomeView() -> some View{
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
    static func makeSignUpView(publisher: PassthroughSubject<Bool, Never>)-> some View{
        let viewModel = SignUpViewModel()
        viewModel.publisher = publisher
        return SignUpView(viewModel: viewModel)
    }
}
