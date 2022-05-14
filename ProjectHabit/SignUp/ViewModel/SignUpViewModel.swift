//
//  SignUpViewModel.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 09/05/22.
//

import SwiftUI
import Combine
class SignUpViewModel: ObservableObject{
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var phone = ""
    @Published var document = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    
    @Published var uiState: SignUpUIState = .none
    var publisher: PassthroughSubject<Bool, Never>!
    func signUp(){
        self.uiState = .loading
        WebService.postUser(fullName: fullName, email: email, document: document, phone: phone, gender: gender.index, birthday: birthday, password: password)
        
    }
}
extension SignUpViewModel{
    func homeView() ->some View{
        return SignUpViewRouter.makeHomeView()
    }
  
}
