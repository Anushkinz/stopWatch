//
//  ContentView.swift
//  stopWatch
//
//  Created by admin on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
   @State private var isShowingRed = false
   @ObservedObject var stopWatchManager = StopWatchManager()
   @State private var timerIndex = 0
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    isShowingRed = false
                }) {
                    TimerButton(label: "Timer", buttonColor: .black, textColor: .red)
                }
                Button(action: {
                    self.isShowingRed.toggle()
                }) {
                    TimerButton(label: "StopWatch", buttonColor: .red, textColor: .black)
                }
            }
            Text(String(format: "%.1f:%.1f:%.1f",stopWatchManager.hoursElapsed,stopWatchManager.minutesElapsed, stopWatchManager.secondsElapsed))
                .font(.custom("Avenir", size: 50))
                .padding(.top , 50)
                .padding(.bottom, 50)
                .padding(.trailing, 5)
                .padding(.leading, 5)
//            if stopWatchManager.mode == .stopped{
            if isShowingRed{
            HStack{
                Picker(selection: $timerIndex , label: Text("Picker")) {
                    ForEach(0..<60){index in
                        Text(String(index)+" sec").tag(index)
                    }
                }
            }.transition(.scale)
            }
            HStack{
                Button(action: {
                    self.stopWatchManager.stop()
                }){
                    TimerButton(label: "[]", buttonColor: .yellow, textColor: .black)
                }
                Button(action: {
                    self.stopWatchManager.pause()
                }){
                    TimerButton(label: "||", buttonColor: .yellow, textColor: .black)
                }
                Button(action: {
                    print(timerIndex)
                    self.stopWatchManager.start()
                }){
                    TimerButton(label: ">", buttonColor: .yellow, textColor: .black)
                }
                
            }
//            }
//            if stopWatchManager.mode == .running{
//                Button(action: {
//                    self.stopWatchManager.pause()
//                }){
//                    TimerButton(label: "Pause", buttonColor: .yellow, textColor: .black)
//                }
//            }
//            if stopWatchManager.mode == .paused{
//                Button(action: {
//                    self.stopWatchManager.start()
//                }){
//                    TimerButton(label: "Start", buttonColor: .yellow, textColor: .black)
//                }
//                Button(action: {
//                    self.stopWatchManager.stop()
//                }){
//                    TimerButton(label: "Stop", buttonColor: .red, textColor: .white)
//                }
//            }
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    let textColor: Color
    
    
    var body: some View {
        
        Text(label)
            .foregroundColor(textColor)
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .background(buttonColor)
            .cornerRadius(50)
    }
}
