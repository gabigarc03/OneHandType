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
    @State private var righty = false
    @State private var lefty = false
    @State private var sentAlert = false
    @State private var sentText = ""
    @State private var offset = 0
    @State private var volume: Double = 50
    @State private var showFnKeys = false
    
    @FocusState private var fieldFocused: Bool
    
    var body: some View {
        ScrollViewReader { value in
        ScrollView{
            VStack {
                if !tapped {
                    Button("Connect to Bluetooth!") {
                        tapped.toggle()
                    }.padding(.bottom, 150)
                        .padding(.top, 350)
                        .buttonStyle(.borderedProminent)
                    
                    //Can be added back, just makes Bluetooth screen busy
                    /*List {
                        Text("Bluetooth device 1")
                        Text("Bluetooth device 2")
                        Text("Bluetooth device 3")
                        Text("Personal laptop")
                    }.frame(width: 300, height: 200, alignment: .center)*/
                }
                
                if tapped {
                    Button("Disconnect Bluetooth") {
                        tapped.toggle()
                    }.buttonStyle(.bordered)
                    
                    Text("Adjust computer volume:")
                    
                    Slider(value: $volume, in: 0...100)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                    
                    Spacer().frame(height: 100)
                    
                    Text("Which hand are you using?")
                        .font(.title2)
                        .padding()
                    
                    Picker("Which hand are you using?", selection: $offset) {
                        Text("Left").tag(-20)
                        Text("Both").tag(0)
                        Text("Right").tag(20)
                    }.pickerStyle(.segmented)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                    
                    Spacer().frame(height: 100)
                    
                    Button("Send text to computer") {
                        sentText = entry
                        entry = ""
                        sentAlert = true
                    }.padding(20)
                        .buttonStyle(.borderedProminent)
                    
                    Grid {
                        GridRow {
                            Button("control") {
                                entry += "⌃"
                            }.buttonStyle(.bordered)
                            
                            Button("option") {
                                entry += "⌥"
                            }.buttonStyle(.bordered)
                            
                            Button("command") {
                                entry += "⌘"
                            }.buttonStyle(.bordered)
                        }
                        
                        
                        GridRow {
                            Button("tab") {
                                entry += "\t"
                            }.buttonStyle(.bordered)
                            
                            Button("delete") {
                                entry += "+DEL"
                            }.buttonStyle(.bordered)
                            
                            Button("esc") {
                                entry += "+ESC"
                            }.buttonStyle(.bordered)
                        }
                        
                        Divider()
                        
                        if !showFnKeys {
                            Button("Show function keys") {
                                showFnKeys.toggle()
                            }.buttonStyle(.bordered)
                        }
                        
                        if showFnKeys {
                            Button("Hide function keys") {
                                showFnKeys.toggle()
                            }.buttonStyle(.bordered)
                            
                            GridRow {
                                Button("F1") {
                                    entry += "+F1"
                                }
                                .buttonStyle(.bordered)
                                Button("F2") {
                                    entry += "+F2"
                                }
                                .buttonStyle(.bordered)
                                Button("F3") {
                                    entry += "+F3"
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            GridRow {
                                Button("F4") {
                                    entry += "+F4"
                                }
                                .buttonStyle(.bordered)
                                Button("F5") {
                                    entry += "+F5"
                                }
                                .buttonStyle(.bordered)
                                Button("F6") {
                                    entry += "+F6"
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            GridRow {
                                Button("F7") {
                                    entry += "+F7"
                                }
                                .buttonStyle(.bordered)
                                Button("F8") {
                                    entry += "+F8"
                                }
                                .buttonStyle(.bordered)
                                Button("F9") {
                                    entry += "+F9"
                                }
                                .buttonStyle(.bordered)
                            }
                            
                            GridRow {
                                Button("F10") {
                                    entry += "+F10"
                                }
                                .buttonStyle(.bordered)
                                Button("F11") {
                                    entry += "+F11"
                                }
                                .buttonStyle(.bordered)
                                Button("F12") {
                                    entry += "+F12"
                                }
                                .buttonStyle(.bordered)
                            }
                            
                        }
                        
                        
                        TextField("Enter text here", text: $entry, axis: .vertical)
                            .focused($fieldFocused)
                            .onSubmit {
                                sentText = entry
                                entry = ""
                                sentAlert.toggle()
                            }
                            .padding(30)
                            .id(42)
                            .onTapGesture {
                                value.scrollTo(43)
                            }
                            .textFieldStyle(.roundedBorder)
                            .alert("Text sent to computer:", isPresented: $sentAlert) {
                                
                                Button("OK", role: .cancel) {
                                    sentAlert = false
                                }
                            } message: {
                                Text("\(sentText)")
                            }
                        
                        Spacer().frame(height: 300)
                        
                        Text("").id(43)
                    }
                }
            }
            .offset(x: CGFloat(offset))
            .padding()
        }
        .scrollDismissesKeyboard(.interactively)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
