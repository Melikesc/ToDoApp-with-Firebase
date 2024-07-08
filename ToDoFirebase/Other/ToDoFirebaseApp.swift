//
//  ToDoFirebaseApp.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoFirebaseApp: App {
    
    // Uygulama başlatıldığında Firebase yapılandırması yapılır
    init(){
        FirebaseApp.configure()
    }

    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
