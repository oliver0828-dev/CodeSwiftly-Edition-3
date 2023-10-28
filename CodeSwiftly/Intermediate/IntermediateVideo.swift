//
//  IntermediateVideo.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/22.
//
import Foundation
import SwiftUI

struct IntermediateVideoList{
    static let intermediate = [
        Video(imageName: "ct", title: "Collection Type", description: " Arrays are ordered collections of values, and each element in an array is assigned a unique index. You can store multiple values of the same type in an array. Dictionaries are collections of key-value pairs. Each value in a dictionary is associated with a unique key, allowing you to retrieve values based on their keys. Sets are unordered collections of distinct values. They are useful when you want to store a list of values without duplicates.", uploadDate: "October 2, 2023", url: URL(string: "https://www.youtube.com/watch?v=CHIAvgQaIiI")!),
        Video(imageName: "Loops", title: "For & While Loop", description: "Loops are essential building blocks in programming, and Swift offers three main types of loops to control the flow of your code. With a for-in loop, you can easily iterate over collections like arrays, ranges of numbers, or other sequences. This loop structure helps you perform actions on each item in the collection effortlessly. The while loop is a valuable tool when you want to repeatedly execute a block of code based on a specific condition. It checks the condition before each iteration, ensuring your code runs as long as the condition remains true.", uploadDate: "October 2, 2023", url: URL(string: "https://youtu.be/ESjQSWHsTJM")!),
        Video(imageName: "is", title: "Conditional Statement", description: "Conditional statements are a fundamental aspect of programming in Swift. They allow you to control the flow of your code by making decisions based on certain conditions. In Swift, you can use conditional statements to execute different blocks of code depending on whether specific conditions are true or false.", uploadDate: "October 2, 2023", url: URL(string: "https://youtu.be/xXIqJhUypRA")!)
  
        
        
    ]
}
