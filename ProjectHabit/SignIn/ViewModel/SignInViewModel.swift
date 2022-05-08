//
//  SignInViewModel.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 07/05/22.
//

import SwiftUI
class SignInViewModel: ObservableObject{
    
    @Published var uiState: SignInUIState = .none
    
    func login(email: String, password: String){
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            //aqui é chamado depois de 3 seg
            self.uiState = .goToHomeScreen
        }    }
}
