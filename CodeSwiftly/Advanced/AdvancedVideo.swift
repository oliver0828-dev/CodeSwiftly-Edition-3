//
//  AdvancedVideo.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/23.
//

import Foundation
import SwiftUI

struct AdvancedVideoList{
    static let advanced=[
        Video(imageName: "optionals", title: "Optionals in Swift", description: "In Swift, the term Optional is a fundamental concept used to represent the presence or absence of a value in a variable or property. It addresses the problem of handling variables that might not have a valid value, which can lead to runtime errors if not handled properly.", uploadDate: "October 2, 2023", url: URL(string: "https://youtu.be/icZsXtwuZcE")!),
        Video(imageName: "structure", title: "Structure in Swift", description: "In Swift, a structure, often referred to as a struct, is a user-defined data type used to group related data values and behaviors together. Structs are a part of Swift's value types, which means that when you create an instance of a struct and assign it to another variable or pass it as an argument, you're working with a copy of the original data, not a reference to it. ", uploadDate: "October 2, 2023", url: URL(string: "https://youtu.be/sXMe5h6yfOI")!)
    ]
}

