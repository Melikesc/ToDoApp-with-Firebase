//
//  ToDoListView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseFirestoreSwift
import SwiftUI

// Yapılacaklar listesi görünümü
struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem] // Firestore'dan çekilen yapılacaklar listesi öğeleri
    
    init(userId: String) { 
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
         )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button ("Sil"){
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("Görevler")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true 
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "N4FVWB8iLgWZfq6bZU46JeIZlhC3")
}
