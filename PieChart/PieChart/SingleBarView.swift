//
//  SingleBarView.swift
//  PieChart
//
//  Created by Ian Creech on 2/4/22.
//

import SwiftUI

struct SingleBarView: View {
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                ForEach(data) { i in
                    Rectangle()
                        .fill(i.color)
                        .frame(width: getWidth(width: geo.frame(in: .global).width, value: i.percent))
                }
            }
        }
        .frame(width: 250, height: 20)
        .cornerRadius(3)
    }
}

struct SingleBarView_Previews: PreviewProvider {
    static var previews: some View {
        SingleBarView()
    }
}
