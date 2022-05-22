//
//  SignInViewModel.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 07/05/22.
//

import SwiftUI
import Combine
class SignInViewModel: ObservableObject{
    
    @Published var uiState: SignInUIState = .none
    @Published var email = ""
    @Published var password = ""
    private var cancellable: AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
    
    init(){
        cancellable = publisher.sink{
            value in print("Usuario criado! Go home: \(value)")
            
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    deinit{
        cancellable?.cancel()
    }
    func login(){
        WebService.login(request: SignInRequest(email: <#T##String#>, password: <#T##String#>)
    }
}
extension SignInViewModel{
    func homeView() ->some View{
        return SignInViewRouter.makeHomeView()
    }
    
    func signUpView() -> some View{
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}
