//
//  VideoDetailView.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/20.
//

import SwiftUI

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(12)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 40){
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
            
            Text(video.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: video.url, label:  {
               OPButton(name: "Watch Now")
                
            })
            
        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: BeginnerVideoList.beginner.first!)
    }
}

struct OPButton: View {
    var name: String
    var body: some View {
        HStack {
            Image("YoutubeLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(name)
                .bold()
                .font(.title2)
        }
        .frame(width: 200, height: 50)
        .foregroundColor(.white)
        .background(Color(.systemRed))
        .cornerRadius(10)
    }
}


