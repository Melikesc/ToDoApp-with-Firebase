//
//  ToDoListViewViewModel.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseFirestore
import Foundation

// Öğeler listesi görünümü için ViewModel
/// Primary tab
class ToDoListViewViewModel: ObservableObject {

    // Yeni öğe eklemek için görünümün gösterilip gösterilmeyeceğini kontrol eder
    @Published var showingNewItemView = false
    
    private let userId: String // Kullanıcı ID'si
    
    init(userId: String) {
        self.userId = userId
    }
    
    // Bir yapılacaklar listesi öğesini siler
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
