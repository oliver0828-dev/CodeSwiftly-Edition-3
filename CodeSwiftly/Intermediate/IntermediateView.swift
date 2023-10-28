//
//  IntermediateView.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/19.
//

import SwiftUI

struct IntermediateView: View {
    @State var videos: [Video] = IntermediateVideoList.intermediate
    @EnvironmentObject var progressData: ProgressData

    var body: some View {
        List(videos.indices, id: \.self) { index in
            HStack {
                Image(videos[index].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70)
                    .cornerRadius(4)
                    .padding(.vertical, 4)

                VStack(alignment: .leading, spacing: 5) {
                    Text(videos[index].title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)

                    Text(videos[index].uploadDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Button(action: {
                    videos[index].isChecked.toggle()
                    UserDefaults.standard.set(videos[index].isChecked, forKey: videos[index].id.uuidString)
                    if videos[index].isChecked {
                        progressData.completedVideos += 1
                    } else {
                        progressData.completedVideos -= 1
                    }
                }) {
                    Image(systemName: videos[index].isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(videos[index].isChecked ? Color.blue : Color.gray)
                }
                .buttonStyle(PlainButtonStyle())
                .onAppear {
                    videos[index].isChecked = UserDefaults.standard.bool(forKey: videos[index].id.uuidString)
                }

            }
            .background(NavigationLink("", destination: VideoDetailView(video: videos[index])).opacity(0))
        }
        .navigationTitle("Intermediate Course")
        .onAppear {
            let currentCompleted = videos.filter { $0.isChecked }.count
            progressData.completedVideos += currentCompleted
        }
    }
}

struct IntermediateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IntermediateView()
                .environmentObject(ProgressData())
        }
    }
}
