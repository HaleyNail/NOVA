//
//  rollingMotionApp.swift
//  rollingMotion
//
//  Created by Ian Nail on 12/26/23.
//

import SwiftUI

@main
struct rollingMotionApp: App {
    var body: some Scene {
        
        @ObservedObject var myMotionInfo:  myMotionInfo = myMotionInfo()
        @ObservedObject var myViewinfo:  myViewinfo = myViewinfo()

        WindowGroup {
            contentView(myMotionInfo:  myMotionInfo, myViewinfo:  myViewinfo)
        }
    }
}
