//  ContentView.swift
//  SwiftUI-ActionSheets-Alerts-Modals-Popovers


import SwiftUI

struct ContentView: View {
    
    struct Message: Identifiable {
        let id = UUID()
        let text: String
    }
    
    @State private var message: Message? = nil
    
    var body: some View {
        Group {
            NavigationView {
                VStack {
                    ActionSheetView()
                    Spacer()
                    Button("Show action sheet") {
                        self.message =  Message(text: "Hi!")
                    }
                    Spacer()
                    ModelView()
                    Spacer()
                    PopOverView()
                    
                }.alert(item: $message) { (message) -> Alert in
                    Alert(title: Text(message.text), message: nil, dismissButton: .cancel())
                }
             .navigationBarTitle("ActionSheets")
            }
        }
    }
}

// Modals View

struct ModelView: View {
    @State private var showModal = false
    
    var body: some View {
        VStack {
            Button("Show modal") {
                self.showModal = true
            }
        }
        .sheet(isPresented: $showModal, onDismiss: {
            print(self.showModal)
        }) {
            Text("This is Modal view")
        }
    }
}

// PopOverView

struct PopOverView: View {
    
    @State private var showPopover: Bool = false
    
    var body: some View {
        VStack {
            Button("Show popover") {
                self.showPopover = true
            }
            .popover(isPresented: self.$showPopover, arrowEdge: .trailing) {
                Text("Popover")
            }
        }
    }
}

struct ActionSheetView: View {
    
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

