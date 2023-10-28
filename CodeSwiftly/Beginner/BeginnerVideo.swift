//
//  BeginnerDB.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/20.
//

import Foundation
import SwiftUI

struct Video: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let uploadDate: String
    let url: URL
    var isChecked: Bool = false
}

struct BeginnerVideoList {
    static let beginner = [
        Video(imageName: "gettingstarted", title: "Getting Started", description: "We will be using two different coding compliers in this course: Xcode and Swift Playgrounds", uploadDate: "September 26, 2023", url: URL(string :"https://www.youtube.com/watch?v=6EsEETCXT8Y")!),
        Video(imageName: "VnC", title: "Variable & Constant", description: "Variables and constants are fundamental to any programming language, and Swift is no exception. They allow you to store and manage data in your applications. In Swift, you can declare variables and constants to hold values of different types, such as integers, floating-point numbers, strings, and more.", uploadDate: "September 26, 2023", url: URL(string: "https://www.youtube.com/watch?v=EX89bob6Jb4")!),
        Video(imageName: "da", title: "Data Types and Arithematic Operators", description: "Data types in Swift define the kind of values a variable or constant can hold. Swift offers a range of data types, including integers (Int), floating-point numbers (Double), booleans (Bool), strings (String). We will be also learning about the basic arithemetic operators.", uploadDate: "October 2, 2023", url: URL(string: "https://www.youtube.com/watch?v=wNHnMjfT96s")!)
    ]
}


