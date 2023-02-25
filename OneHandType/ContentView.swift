//
//  ContentView.swift
//  OneHandType
//
//  Created by Gabi Garcia on 2/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapped = true
    @State private var entry = ""
    @State private var righty = false
    @State private var lefty = false
    @State private var sentAlert = false
    @State private var sentText = ""
    @State private var offset = 0
    
    var body: some View {
            VStack {
                if !tapped {
                    Button("Connect to Bluetooth!") {
                        tapped.toggle()
                    }.offset(y:350)
                        .padding(.bottom, 275)
                    
                    List {
                        Text("Bluetooth device 1")
                        Text("Bluetooth device 2")
                        Text("Bluetooth device 3")
                        Text("Personal laptop")
                    }.padding(.top, 200)
                }
                
                if tapped {
                    Text("Are you:")
                        .font(.callout)
    
                    HStack {
                        Button("Left handed?") {
                            lefty.toggle()
                            offset = -20
                        }.padding(.trailing, 50)
                        Button("Right handed?") {
                            righty.toggle()
                            offset = 20
                        }
                    }.padding()
                    
                    Button("Send text") {
                        sentText = entry
                        entry = ""
                        sentAlert = true
                    }.padding()
                    
                    Button("Disconnect") {
                        tapped.toggle()
                    }.buttonStyle(.bordered)
                    .padding(.bottom, 100)
                    
                    
                    TextField("Enter text here", text: $entry, axis: .vertical)
                        .onSubmit {
                            sentText = entry
                            entry = ""
                            sentAlert.toggle()
                        }
                        .padding(30)
                    
                        .alert("Text sent: \(sentText)", isPresented: $sentAlert) {
                            Button("OK", role: .cancel) {
                                sentAlert = false
                                
                            }
                        }
                }
            }
            .offset(x: CGFloat(offset))
            .padding()
            .textFieldStyle(.roundedBorder)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
