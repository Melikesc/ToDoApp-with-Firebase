//
//  ProfileView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI

// Kullanıcı profili görünümü
struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                    
                } else {
                    Text("Profil yükleniyor..")
                }
            }
            .navigationTitle("Profil")
        }
        .onAppear{ // Görünüm yüklendiğinde kullanıcı bilgisini getir
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .foregroundColor(Color.blue)
              .frame(width: 125 , height: 125)
              .padding()
          
          VStack(alignment: .leading) {
              HStack{
                  Text("Ad:")
                      .bold()
                  Text(user.name)
              }
              .padding()
              
              HStack{
                  Text("Email:")
                      .bold()
                  Text(user.email)
              }
              .padding()
              
              HStack{
                  Text("Şu tarihten beri üye:")
                      .bold()
                  Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
              }
              .padding()
          }
          .padding()
          
          Button("Çıkış Yap") {
              viewModel.logOut()
          }
          .tint(.red)
           .padding()
          
          Spacer()
    }
    
}

#Preview {
    ProfileView()
}
