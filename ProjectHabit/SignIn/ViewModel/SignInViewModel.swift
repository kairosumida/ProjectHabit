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
        self.uiState = .loading
        WebService.login(request: SignInRequest(email: email, password: password)){(successResponse, errorResponse) in
            if let error = errorResponse{
                DispatchQueue.main.async {
                    self.uiState = .error(error.detail)
                    }
                }
            if let success = successResponse{
                DispatchQueue.main.async {
                    print(success)
                    self.uiState = .goToHomeScreen
                }
            }
            
        }
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
