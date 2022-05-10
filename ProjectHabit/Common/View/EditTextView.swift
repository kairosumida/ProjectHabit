//
//  EditTextView.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 10/05/22.
//

import SwiftUI

struct EditTextView: View{
    var placeholder: String = ""
    @Binding var text: String
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    var body: some View{
        VStack{
            if isSecure{
            SecureField(placeholder, text: $text)
                .foregroundColor(Color("textColor"))
                .keyboardType(keyboard)
                .textFieldStyle(CustomTextFieldStyle())
            }
            else{
                TextField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            
            if let error = error, !error.isEmpty, failure == true {
                Text(error).foregroundColor(.red)
            }
        }
        .padding(.bottom, 10)
    }
}

struct EditTextView_Preview: PreviewProvider{
    static var previews: some View{
        ForEach(ColorScheme.allCases, id: \.self){ value in
            VStack{
                EditTextView(placeholder: "Email",
                             text: .constant("Texto"),
                             error: "Campo Inválido",
                             failure: "".count < 5)
                .padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .previewDevice("IPhone 11")
                .preferredColorScheme(value)
        }
    }
}
