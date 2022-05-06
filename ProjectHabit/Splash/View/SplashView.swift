//
//  SplashView.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 06/05/22.
//

import SwiftUI

struct SplashView: View {
    @State var state: SplashUIState = .goToSignInScreen
    var body: some View {
        switch state {
        case .loading:
            Text("Loading")
        case .goToSignInScreen:
            Text("Carregar Tela de Login")
        case .goToHomeScreen:
            Text("Carregar tela principal")
        case .error(let msg):
            Text("mostrar erro: \(msg)")
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}