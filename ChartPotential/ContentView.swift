//  ContentView.swift
//  Created by Darren Li on 25/1/2024.
//
//  "ptt" means potential

import SwiftUI
import Foundation
import Darwin

//The initial page
struct InputView: View {
    @State private var potential = "" //target chart potential
    @State private var constant = "" //chart constant
    var body: some View {
        NavigationStack{
            VStack (spacing:15){
                Text("求推分分数")
                Section(header: Text("铺面潜力值")) {
                                TextField("输入铺面潜力值", text: $potential)
                            }
                Section(header: Text("铺面定数")) {
                                TextField("输入铺面定数", text: $constant)
                            }
                NavigationLink {
                    ShowView(constant:constant, potential:potential)
                } label: {
                    Label("结果", systemImage: "magnifyingglass.circle.fill")
                }

                }
            }
            .padding()
            .navigationTitle("Tools")
        }
    }

//The answer page
struct ShowView: View {
    var constant = ""  //For receiving input chart constant from the previous page
    var potential = "" //For receiving input target chart potential from the previous page
    func FindTargetScore(A:String, B:String) -> String{
        var const = Double(A) ?? 0.0 //convert String-type chart constant to Double
        var poten = Double(B) ?? 0.0 //convert String-type potential to Double
        var chart_ptt:Double
        var target = ""
        if const - poten < 2{ //If difference > 2, it is impossible to reach the target chart potential
            for i in 1...500001{ //Check the possible score to reach target chart potential from 950w to 1000w
                if i < 300000{ //Use the rule for calculating chart ptt from 950w to 980w
                    chart_ptt = const+(Double(i)/300000.0)
                    if chart_ptt > poten{ //To make sure the chart ptt is higher than the target chart ptt
                        target = String(i+9500000)
                        break
                    }
                    var i = i + 1
                }
                if i > 300000 { //Use the rule for calculating chart ptt from 980w to 1000w
                    chart_ptt = const+1+((Double(i)-300000)/200000.0)
                    if chart_ptt > poten{ //To make sure the chart ptt is higher than the target chart ptt
                        target = String(i-300000+9800000)
                        break
                    }
                    var i = i + 1
                }
            }
        }
        return target
    }
    
    var body: some View {
        Text(FindTargetScore(A:constant, B:potential)) //Show the possible score
    }
}
