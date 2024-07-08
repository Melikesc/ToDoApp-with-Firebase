//
//  LoginView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI

// Kullanıcı giriş ekranı görünümü
struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                //header
                HeaderView(title: "Yapılacaklar", subtitle: "Hadi Başlayalım", angle: 15, background: Color("customGreen"))
            
                
                //login
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    
                    TextField("Email Adresi", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Parola", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Giriş Yap", background: .blue)
                    {
                        viewModel.login()
                    }
                    .padding()

                }
                .offset(y: -50)
                
                VStack {
                    Text("Burada yeni misin?")
                    NavigationLink("Hesap Oluştur.", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                
                Spacer()
            }
        }
    }
}


#Preview {
    LoginView()
}
