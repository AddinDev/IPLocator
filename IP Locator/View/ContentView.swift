//
//  ContentView.swift
//  IP Locator
//
//  Created by addjn on 04/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networking = Networking()
    @State private var word = ""
    @State private var isEditing = false
    var isShowing = false
    
    var body: some View {
        VStack {
            
            MapView(latitude: Double(networking.status?.data?.geo?.latitude ?? 0), longtitude: Double(networking.status?.data?.geo?.longitude ?? 0))
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            HStack {
                TextField("Enter IP", text: $word, onCommit: {
                    self.networking.getData(ip: self.word)
                })
                    .padding(7)
                    .background(Color(.systemGray6))
                    .padding(.horizontal, 25)
                    .cornerRadius(8)
                    .onTapGesture {
                        self.isEditing = true
                }
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.word = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.opacity)
                    .animation(.default)
                }
            }
            
            Form {
                Section {
                    HStack {
                        Text("IP Address")
                        Spacer()
                        Text(networking.status?.data?.geo?.ip ?? "Null")
                    }
                    HStack {
                        Text("ISP")
                        Spacer()
                        Text(networking.status?.data?.geo?.isp ?? "Null")
                    }
                    HStack {
                        Text("Continent")
                        Spacer()
                        Text(networking.status?.data?.geo?.continentName ?? "Null")
                    }
                    HStack {
                        Text("Country")
                        Spacer()
                        Text(networking.status?.data?.geo?.countryName ?? "Null")
                    }
                    HStack {
                        Text("City")
                        Spacer()
                        Text(networking.status?.data?.geo?.city ?? "Null")
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
