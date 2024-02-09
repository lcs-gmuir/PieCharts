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
    @State private var selectedStudy: Int?
    @State private var selectedSector: String?
    
    private func findSelectedSector(value: Int) -> String? {

        var accumulatedAvg = 0

        let study = Grades.first { (_, avg) in
            accumulatedAvg += avg
            return value <= accumulatedAvg
        }

        return study?.study
    }
    var body: some View {
        Chart {
            ForEach(Grades, id: \.study) { studys in
                SectorMark(angle: .value("study", studys.avg),
                           innerRadius: .ratio(0.65)
                )
                .opacity(selectedSector == nil ? 1.0 : (selectedSector == studys.study ? 1.0 : 0.5))
                
                .foregroundStyle(by: .value("subject", studys.study ))
                .annotation(position: .overlay){
                    Text("\(studys.avg)")
                        .font(.title)
                }

            }

        }
        .chartAngleSelection(value: $selectedStudy)
        .onChange(of: selectedStudy) { oldValue, newValue in
            if let newValue {
                selectedSector = findSelectedSector(value: newValue)
            } else {
                selectedSector = nil
            }
        }
    }
}

#Preview {
    myOwnDonutChart()
}
