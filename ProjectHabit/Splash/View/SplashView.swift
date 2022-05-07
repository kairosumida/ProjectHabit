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
            ZStack{
                Image("logo").resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(20)
                    .background(Color.red)
                    .ignoresSafeArea()
            }
        case .goToSignInScreen:
            Text("Carregar Tela de Login")
        case .goToHomeScreen:
            Text("Carregar tela principal")
        case .error(let msg):
            Text("mostrar erro: \(msg)")
        }
    }
}
struct LoadingView: View{
    var body: some View {
        ZStack{
            Image("logo").resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.red)
                .ignoresSafeArea()
        }
    }
}
extension SplashView {
    var loading: some View{
        ZStack{
            Image("logo").resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.red)
                .ignoresSafeArea()
        }
    }
}
extension SplashView {
    func loadingView()-> some View{
        ZStack{
            Image("logo").resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.red)
                .ignoresSafeArea()
            
        }
    }
}
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(state: .loading)
    }
}
