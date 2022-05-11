//
//  SplashView.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 06/05/22.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel
    var body: some View {
        Group{
            switch viewModel.uiState {
            case .loading:
                ZStack{
                    Image("logo").resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(20)
                        .ignoresSafeArea()
                }
            case .goToSignInScreen:
                viewModel.signInView()
            case .goToHomeScreen:
                Text("Carregar tela principal")
            case .error(let msg):
                loadingView(error: msg)
            }
        }.onAppear(perform: viewModel.onAppear)
    }
}


extension SplashView {
    func loadingView(error: String? = nil)-> some View{
        ZStack{
            Image("logo").resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
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
        ForEach(ColorScheme.allCases, id: \.self){ value in
            let viewModel = SplashViewModel()
            SplashView(viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .previewDevice("IPhone 11")
                .preferredColorScheme(value)
        }
        
    }
}
