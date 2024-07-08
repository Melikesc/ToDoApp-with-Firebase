//
//  NewItemView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI

// Yeni yapılacaklar listesi öğesi ekleme görünümü
struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    // Yeni öğe ekranının gösterilip gösterilmediğini kontrol eder
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("Yeni Görev")
                .font(.system(size: 32))
                .bold()
                .padding(.top,40)
            
            Form {
                //başlık
                TextField("Başlık",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //bitiş tarihi
                DatePicker("Bitiş Tarihi", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //buton
                TLButton(
                    title: "Kaydet",
                    background: .pink)
                {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                   
                }
                .padding() 
          
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Hata"),
                    message: Text("Lütfen tüm alanları doldurun ve bitiş tarihi seçin")
                )
            }


            
            
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
