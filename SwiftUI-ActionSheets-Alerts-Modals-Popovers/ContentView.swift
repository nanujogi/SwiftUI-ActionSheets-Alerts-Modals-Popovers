//  ContentView.swift
//  SwiftUI-ActionSheets-Alerts-Modals-Popovers


import SwiftUI

struct ContentView: View {
    
    struct Message: Identifiable {
        let id = UUID()
        let text: String
    }
    
    @State private var message: Message? = nil
    
    @State private var showActionSheet = false
   
    var body: some View {
        
        VStack {
            Button("Show action sheet") {
                self.message =  Message(text: "Hi!")
            }
            
        }.alert(item: $message) { (message) -> Alert in
            Alert(title: Text(message.text), message: nil, dismissButton: .cancel())
        }
    }
}
