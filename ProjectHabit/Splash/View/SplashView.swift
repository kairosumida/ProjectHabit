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
            loadingView(error: msg)
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
    func loadingView(error: String? = nil)-> some View{
        ZStack{
            Image("logo").resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.red)
                .ignoresSafeArea()
            
            if let error = error{
                Text("").alert(isPresented: .constant(true)){
                    Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("Ok")){
                        //Faz algo quando o alert some
                    })
                }
            }
        }
    }
}
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(state: .error("teste de erro no servidor"))
    }
}
