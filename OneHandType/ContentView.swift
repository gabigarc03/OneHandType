//
//  ContentView.swift
//  OneHandType
//
//  Created by Gabi Garcia on 2/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapped = false
    @State private var entry = ""
    var body: some View {
        if !tapped {
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
                    Text("Button tapped!").font(.largeTitle)
                    Button("Disconnect") {
                        tapped.toggle()
                    }
                    TextField("Enter text here", text: $entry, axis: .vertical)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
