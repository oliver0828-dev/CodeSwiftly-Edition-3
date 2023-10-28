//
//  ProgressData.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/19.
//

import SwiftUI
import Combine

class ProgressData: ObservableObject {
    @Published var completedVideos: Int = UserDefaults.standard.integer(forKey: "completedVideosCount") {
        didSet {
            UserDefaults.standard.setValue(completedVideos, forKey: "completedVideosCount")
            UserDefaults.standard.synchronize()  // 이 줄을 추가합니다.
        }
    }
    
    @Published var totalVideos: Int = 0

    init() {
        updateTotalVideos()
    }

    func updateTotalVideos() {
        totalVideos = BeginnerVideoList.beginner.count + IntermediateVideoList.intermediate.count + AdvancedVideoList.advanced.count + DevelopVideoList.develop.count
        
        let beginnerCompleted = BeginnerVideoList.beginner.filter { UserDefaults.standard.bool(forKey: $0.id.uuidString) }.count
        let intermediateCompleted = IntermediateVideoList.intermediate.filter { UserDefaults.standard.bool(forKey: $0.id.uuidString) }.count
        let advancedCompleted = AdvancedVideoList.advanced.filter { UserDefaults.standard.bool(forKey: $0.id.uuidString) }.count
        let developCompleted = DevelopVideoList.develop.filter { UserDefaults.standard.bool(forKey: $0.id.uuidString) }.count
        
        completedVideos = beginnerCompleted + intermediateCompleted + advancedCompleted + developCompleted
    }
}


