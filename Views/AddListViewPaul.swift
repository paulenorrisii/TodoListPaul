//
//  AddViewPaul.swift
//  TodoList
//
//  Created by Paul Norris on 5/4/25.
//
// 18:24 in

import SwiftUI

struct AddListViewPaul: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var backColor: Color = Color(#colorLiteral(red: 0.9254902005, green: 0.9254902005, blue: 0.9254902005, alpha: 1))
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Type your item here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed,
                       label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
                .padding(14)
                
            }
            
        }
        .navigationBarTitle("Add an Item ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
        func saveButtonPressed() {
            if textIsAppropriate( ) == false {
                
            }
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        func textIsAppropriate() -> Bool {
            if textFieldText.count < 3 {
                alertTitle = "Your todo item must be at least 3 characters long!!! 🤕"
                showAlert.toggle()
                return false
            }
            return true
        }
        func getAlert() -> Alert {
            return Alert(title: Text(alertTitle))
        }
}
    
#Preview {
    NavigationView {
        AddListViewPaul()
    }
    .environmentObject(ListViewModel())
}
