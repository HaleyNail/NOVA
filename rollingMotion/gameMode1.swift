//
//  gameMode1.swift
//  rollingMotion
//
//  Created by Ian Nail on 12/29/23.
//

import SwiftUI

struct gameMode1: View {
    
    @ObservedObject var myMotionInfo: myMotionInfo
    @ObservedObject var myViewinfo: myViewinfo
    @State private var timer: Timer?
    @State private var timerbool: Bool = false
    
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    classic_button(buttonWidth: 40, buttonHeight: 40, fontSize: 16, systemImageName: "line.3.horizontal", buttonColor: .black, fontColor: .white ){
                        if myMotionInfo.isplay {
                            timertoggle()
                            myMotionInfo.isplaytrue()
                        }
                        myViewinfo.myViewOptions = .gameMenu
                    }
                    .padding()
                    Spacer()
                    Text("\(myMotionInfo.score)")
                        .font(.largeTitle)
                    
                    Spacer()
                    classic_button(buttonWidth: 40, buttonHeight: 40, fontSize: 16, systemImageName: "playpause", buttonColor: .black, fontColor: .white ){
                        timertoggle()
                        myMotionInfo.isplaytrue()
                        
                    }
                    .padding()
                }
                Spacer()
            }
        }
        ZStack {
            
            Image(systemName: "star")
            //.font(.title)
                .offset(x: myMotionInfo.xRandom, y: myMotionInfo.yRandom)
            
            Image("rocket")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .colorInvert()
                .rotationEffect(.radians(myMotionInfo.myRadian + 0.785398))
                .offset(x: myMotionInfo.xcoord, y: myMotionInfo.ycoord)
        }
    }
    
    private func startTimer() {
        // Make sure to stop the timer if it's already running
        //stoptimer()
        timerbool = true
        // Start a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 60.0, repeats: true) { timer in
            // Timer action
            //Calculating the angle for the direction the rocket image should point so it appears to point in the direction of travel
            myMotionInfo.calculateMovement()
            
            //Calculating the angle for the direction the rocket image should point so it appears to point in the direction of travel
            myMotionInfo.calculateAngle()
            
            // Setting the boundery
            myMotionInfo.setBoundary()
            
            //print("this is working")
            //if the object is found increment the score and set a new random object
            myMotionInfo.setRandom()
            //print("Timer is running")
        }
    }
    
    private func timertoggle() {
        // Stop the timer if it's running, start if it is not
        
        if !timerbool {
            startTimer()
            print("\(timerbool)")
        } else {
            stoptimer()
            print("\(timerbool)")
        }
    }
    //stop the timer
    private func stoptimer() {
        timer?.invalidate()
        timer = nil
        timerbool = false
    }
    
}

//******** Preview ******** //

#Preview {
    contentView(myMotionInfo: myMotionInfo(), myViewinfo: myViewinfo())
}
