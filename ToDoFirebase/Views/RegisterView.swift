//
//  RegisterView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI

// Kullanıcı kayıt ekranı görünümü
struct RegisterView: View {
    
   @StateObject var viewModel = RegisterViewViewModel()
        
    var body: some View {
        VStack{
            
            //header
            HeaderView(title: "Kayıt Ol", subtitle: "Organize etmeye başlayın..", angle: -15, background: Color("customYellow"))
                
            
            Form{
                
                if !viewModel.errorMessageR.isEmpty {
                    Text(viewModel.errorMessageR)
                        .foregroundColor(Color.red)
                }
                
                TextField("Ad-Soyad" , text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled() // Otomatik düzeltme kapalı
                
                TextField("Email Adresi" , text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Şifre", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Hesabı Oluştur", background: .green)
                {
                    viewModel.register()
                }
                .padding()
                
            }
            .offset(y: -50)
            
            VStack {
                Text("Zaten hesabınız var mı?")
                NavigationLink("Giriş Yap", destination: LoginView())
            }
            .padding(.bottom, 50)
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
