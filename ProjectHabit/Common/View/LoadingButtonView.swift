//
//  LoadingButtonView.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 10/05/22.
//

import SwiftUI

struct LoadingButtonView: View {
    var action: () -> Void
    var text: String
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View {
        ZStack{
            Button(action: {
                action()
            }, label: {
                Text(showProgress ? " " : text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(.title3).bold())
                    .background(disabled ? Color("lightOrange") : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }).disabled(disabled || showProgress)
            
            ProgressView().progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}

struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self){ value in
            VStack{
                LoadingButtonView(action: {
                    print("ola mundo")
                },
                                  text: "Entrar",
                                  showProgress: false,
                                  disabled: false)
                .padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .previewDevice("IPhone 11")
                .preferredColorScheme(value)
        }
        
    }
}
