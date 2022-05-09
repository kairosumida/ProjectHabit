//
//  SignUpViewModel.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 09/05/22.
//

import SwiftUI
import Combine
class SignUpViewModel: ObservableObject{
    
    @Published var uiState: SignUpUIState = .none
    var publisher: PassthroughSubject<Bool, Never>!
    func signUp(){
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            //aqui é chamado depois de 3 seg
            self.uiState = .error("Usuario ja cadastradp")
            self.publisher.send(true)
        }
    }
}
extension SignUpViewModel{
    func homeView() ->some View{
        return SignUpViewRouter.makeHomeView()
    }
  
}
