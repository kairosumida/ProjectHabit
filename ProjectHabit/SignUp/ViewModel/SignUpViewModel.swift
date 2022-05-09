//
//  SignUpViewModel.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 09/05/22.
//

import SwiftUI
class SignUpViewModel: ObservableObject{
    
    @Published var uiState: SignUpUIState = .none
    
    func signUp(){
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            //aqui é chamado depois de 3 seg
            self.uiState = .error("Usuario ja cadastradp")
        }
    }
}
extension SignUpViewModel{
    func homeView() ->some View{
        return SignUpViewRouter.makeHomeView()
    }
  
}
