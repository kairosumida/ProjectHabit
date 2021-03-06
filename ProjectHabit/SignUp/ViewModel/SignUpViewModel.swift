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
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateFormatted = formatter.date(from:  birthday)
        
        guard let dateFormatted = dateFormatted else {
            self.uiState = .error("Data inválida\(birthday)")
            return
        }
        formatter.dateFormat = "yyyy-MM-dd"

        let birthday = formatter.string(from: dateFormatted)
        WebService.postUser(request: SignUpRequest(fullName: fullName, email: email, password: password, document: document, phone: phone, birthday: birthday, gender: gender.index)) { (successResponse, errorResponse ) in
            if let error = errorResponse {
                DispatchQueue.main.async {
                self.uiState = .error(error.detail)
                }
            }
            if let success = successResponse{
                
                WebService.login(request: SignInRequest(email: self.email, password: self.password)){(successResponse, errorResponse) in
                    if let errorSignIn = errorResponse{
                        DispatchQueue.main.async {
                            self.uiState = .error(errorSignIn.detail.message)
                            }
                        }
                    if let successSignIn = successResponse{
                        DispatchQueue.main.async {
                            print(successSignIn)
                            self.publisher.send(true)
                            self.uiState = .success
                        
                    }
                    
                }
                DispatchQueue.main.async {
                    
                    }
                }
            }
        }
        
    }
}
extension SignUpViewModel{
    func homeView() ->some View{
        return SignUpViewRouter.makeHomeView()
    }
  
}
