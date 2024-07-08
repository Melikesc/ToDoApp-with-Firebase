//
//  MainView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI
// Ana görünümü temsil eden SwiftUI View yapısı
struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // Kullanıcı girişi yapılmışsa
            accountView
        } else {
            // Kullanıcı girişi yapılmamışsa giriş ekranını göster
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Anasayfa", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.circle")
                }
        }
    }
    
    
    
}

#Preview {
    MainView()
}
