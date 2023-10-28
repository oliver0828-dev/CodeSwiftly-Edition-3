//
//  HomeView.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/19.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var progressData: ProgressData
    var userName: String

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.blue)
                .ignoresSafeArea(.all)

            VStack {
                Spacer()
                NameView(userName: userName)

                ProgressView(value: Float(progressData.completedVideos), total: Float(progressData.totalVideos))
                    .padding(.horizontal)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.black))
                    .frame(height: 20)

                LazyVGrid(columns: columns) {
                    ButtonBox(imageName: "Beginner Box", destination: AnyView(BeginnerView()))
                    ButtonBox(imageName: "Intermediate Box", destination: AnyView(IntermediateView()))
                    ButtonBox(imageName: "Advanced Box", destination: AnyView(AdvancedView()))
                    ButtonBox(imageName: "Develop Box", destination: AnyView(DevelopView()))
                }
                .padding()

                Button(action: {
                    if let url = URL(string: "https://ritzy-anise-015.notion.site/CodeSwiftly-Guidelines-c4592cdbe0bb44c382e5a71208df60ad?pvs=4") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Text("Help")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                        Image(systemName: "person.fill.questionmark")
                            .foregroundColor(.black)
                    }
                    .frame(width: 280, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                }
                Spacer()
            }
        }
        .onAppear {
            progressData.updateTotalVideos()
        }
    }
}

struct NameView: View {
    var userName: String

    var body: some View {
        HStack {
            Text("Welcome, \(userName)")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding()
            Spacer()
        }
    }
}

struct ButtonBox: View {
    var imageName: String
    var destination: AnyView

    var body: some View {
        NavigationLink(destination: destination) {
            Image(imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
                .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userName: "Test User")
            .environmentObject(ProgressData())
    }
}
