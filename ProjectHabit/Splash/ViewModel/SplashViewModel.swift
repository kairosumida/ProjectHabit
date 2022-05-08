//
//  SplashViewModel.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 07/05/22.
//

import SwiftUI

class SplashViewModel: ObservableObject{
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        //faz algo assincrono e muda o estado da uiState
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            //aqui é chamado depois de 3 seg
            self.uiState = .goToSignInScreen
        }
    }
}

extension SplashViewModel{
    func signInView() -> some View{
        return SplashViewRouter.makeSingInView()
    }
}
