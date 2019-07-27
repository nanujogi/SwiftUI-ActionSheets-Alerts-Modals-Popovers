//  ContentView.swift
//  SwiftUI-ActionSheets-Alerts-Modals-Popovers


import SwiftUI

struct ContentView: View {
    
    @State private var showActionSheet = false
    
    var body: some View {
        
        VStack {
            Button("Show action sheet") {
                self.showActionSheet = true
            }
            
        }.actionSheet(isPresented: $showActionSheet) { ActionSheet(title: Text("Actions"), message: Text("Available actions"), buttons: [.cancel{
            print(self.showActionSheet) },
            .default(Text("Action")),
            .destructive(Text("Delete"))
            ])
        }
    }
}
