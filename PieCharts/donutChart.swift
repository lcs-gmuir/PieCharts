//
//  ContentView.swift
//  PieCharts
//
//  Created by Griffin Muir on 2024-02-07.
//

import SwiftUI
import Charts
struct donutChart: View {
    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]
    var body: some View {
        VStack {
            
            VStack {
                Chart {
                    ForEach(coffeeSales, id: \.name) { coffee in

                        SectorMark(
                            angle: .value("Cup", coffee.count),
                            innerRadius: .ratio(0.65),
                            angularInset: 2.0
                               
                        )
                        .cornerRadius(10.0)
                        .foregroundStyle(by: .value("Type", coffee.name))
                        .annotation(position: .overlay) {
                            Text("\(coffee.count)")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .frame(height: 500)
            }
            .padding()
            
        }
    }
}

#Preview {
    donutChart()
}
