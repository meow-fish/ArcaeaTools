//
//  ContentView.swift
//  PotentialScore
//
//  Created by Darren Li on 25/1/2024.
//

import SwiftUI
import Foundation
import Darwin

struct InputView: View {
    @State private var potential = ""
    @State private var constant = ""
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

struct ShowView: View {
    var constant = ""
    var potential = ""
    func FindTargetScore(A:String, B:String) -> String{
        var const = Double(A) ?? 0.0
        var poten = Double(B) ?? 0.0
        var chart_ptt:Double
        var target = ""
        if const - poten < 2{
            for i in 1...500001{
                if i < 300000{
                    chart_ptt = const+(Double(i)/300000.0)
                    if chart_ptt > poten{
                        target = String(i+9500000)
                        break
                    }
                    var i = i + 1
                }
                if i > 300000 {
                    chart_ptt = const+1+((Double(i)-300000)/200000.0)
                    if chart_ptt > poten{
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
        Text(FindTargetScore(A:constant, B:potential))
    }
}
