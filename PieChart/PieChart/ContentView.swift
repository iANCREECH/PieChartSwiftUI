//
//  PieChartView.swift
//  PieChart
//
//  Created by Ian Creech on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @State var flatDesign: Bool = false // if switched to true, will add shadows to each piece giving depth to the design
    
    var body: some View {
        VStack {
            GeometryReader { g in
                ZStack {
                    ForEach(0..<data.count) { i in
                        DrawShape(flat: flatDesign, center: CGPoint(x: g.frame(in: .global).width / 2, y: g.frame(in: .global).height / 2), index: i)
                    }
                }
            }
            .frame(height: 360)
            .padding(.top, 20)
            .clipShape(Circle())
            .shadow(radius: 8)
            
            VStack {
                ForEach(data) { i in
                    HStack {
                        GeometryReader { g in
                            HStack {
                                Text(i.title)
                                    .frame(width: 100)
                                
                                Spacer(minLength: 0)
                                
                                Rectangle()
                                    .fill(i.color)
                                    .frame(width: getWidth(width: g.frame(in: .global).width, value: i.percent),height: 10)
                                
                                Text(String(format: "\(i.percent)", "%.0f"))
                                    .fontWeight(.bold)
                                    .padding(.leading, 10)
                            }
                        }
                    }
                    .padding(.top, 18)
                }
            }
            .padding()
            
            Spacer()
            
        } // VStack
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DrawShape: View {
    @State var flat: Bool
    var center: CGPoint
    var index: Int
    
    var body: some View {
        Path { path in
            path.move(to: self.center)
            path.addArc(center: self.center, radius: 180, startAngle: .init(degrees: self.start()), endAngle: .init(degrees: self.end()), clockwise: false)
        }
        .fill(data[index].color)
        .shadow(radius: flat == true ? 0 : 5) // MARK: if you want shadows or completely flat looking pie chart
    }
    
    func start() -> Double {
        if index == 0 {
            return 0
        } else {
            var temp: Double = 0
            
            for i in 0...index-1 {
                temp += Double(data[i].percent / 100) * 360
            }
            return temp
        }
    }
    
    func end() -> Double {
        var temp: Double = 0
        
        for i in 0...index {
            temp += Double(data[i].percent / 100) * 360
        }
        return temp
    }
    
    func getDegree() -> Double {
        let temp = data[self.index].percent / 100
        return Double(temp * 360)
    }
}
