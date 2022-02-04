//
//  SampleData.swift
//  PieChart
//
//  Created by Ian Creech on 2/4/22.
//

import SwiftUI

struct Pie: Identifiable {
    var id: Int
    var percent: CGFloat
    var title: String
    var color: Color
}

var data = [
    Pie(id: 0, percent: 5, title: "ObjC", color: .green),
    Pie(id: 1, percent: 25, title: "Swift", color: .orange),
    Pie(id: 2, percent: 25, title: "Java", color: .red),
    Pie(id: 3, percent: 10, title: "Flutter", color: .blue),
    Pie(id: 4, percent: 35, title: "Python", color: .yellow)
]

public func getWidth(width: CGFloat, value: CGFloat) -> CGFloat {
    let temp = value / 100
    return temp * width
}
