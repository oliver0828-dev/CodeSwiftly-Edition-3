//
//  ContentView.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/19.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @AppStorage("userName") var savedName: String = ""
    
    var body: some View {
        NavigationView {
            if savedName.isEmpty {
                VStack {
                    Image("SwiftUI Logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("CodeSwiftly")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding()
                    Text("What is your name?")
                        .font(.title2)
                        .fontWeight(.medium)
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.words)
                        .disableAutocorrection(true)

                    NavigationLink(destination: HomeView(userName: name).environmentObject(ProgressData())) {
                        Text("Submit")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                savedName = name
                            }
                    }
                    .disabled(name.isEmpty)
                }
            } else {
                HomeView(userName: savedName)
                    .environmentObject(ProgressData())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

