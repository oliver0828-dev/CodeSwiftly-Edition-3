//
//  BeginnerView.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/19.
//

import SwiftUI

struct BeginnerView: View {
    // 비디오 목록, ProgressData 환경 객체를 사용
    @State var videos: [Video] = BeginnerVideoList.beginner
    @EnvironmentObject var progressData: ProgressData

    var body: some View {
        List(videos.indices, id: \.self) { index in
            HStack {
                // 썸네일
                Image(videos[index].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70)
                    .cornerRadius(4)
                    .padding(.vertical, 4)

                VStack(alignment: .leading, spacing: 5) {
                    // 비디오 제목
                    Text(videos[index].title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)

                    // 업로드 날짜
                    Text(videos[index].uploadDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                // 완료 상태
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
            // 리스트 아이템을 선택하면 비디오 상세 화면으로 이동
            .background(NavigationLink("", destination: VideoDetailView(video: videos[index])).opacity(0))
        }
        .navigationTitle("Beginner Course")
    }
}

struct BeginnerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BeginnerView()
                .environmentObject(ProgressData())
        }
    }
}

