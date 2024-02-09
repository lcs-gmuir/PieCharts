//
//  myOwnDonutChart.swift
//  PieCharts
//
//  Created by Griffin Muir on 2024-02-08.
//

import SwiftUI
import Charts
struct myOwnDonutChart: View {
    private var Grades = [
        (study: "physics", avg: 88),
        (study: "english", avg: 78),
        (study: "chem", avg: 92),
        (study: "comp si", avg: 95),
        (study: "calculas", avg: 89),
        (study: "math", avg: 87)
    ]

    var body: some View {
        Chart {
            ForEach(Grades, id: \.study) { studys in
                SectorMark(angle: .value("study", studys.avg),
                           innerRadius: .ratio(0.65)
                )
                
                .foregroundStyle(by: .value("subject", studys.study ))
                .annotation(position: .overlay){
                    Text("\(studys.avg)")
                        .font(.title)
                }

            }

        }
    }
}

#Preview {
    myOwnDonutChart()
}
