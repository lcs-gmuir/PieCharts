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
    //making the chart interactable
    @State private var selectedCount: Int?
    @State private var selectedSector: String?
    private func findSelectedSector(value: Int) -> String? {

        var accumulatedCount = 0

        let coffee = coffeeSales.first { (_, count) in
            accumulatedCount += count
            return value <= accumulatedCount
        }

        return coffee?.name
    }
    var body: some View {
        VStack {
            
            VStack {
                
                Chart {
                    ForEach(coffeeSales, id: \.name) { coffee in

                        SectorMark(
                            angle: .value("Cup", coffee.count),
                            //making the chart a donut
                            innerRadius: .ratio(0.65),
                            angularInset: 2.0
                               
                        )
                        .opacity(selectedSector == nil ? 1.0 : (selectedSector == coffee.name ? 1.0 : 0.5))
                        //making the chart round
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
                //adding a background to the chart
                .chartBackground { proxy in
                    Text("coffee")
                    .font(.system(size: 100))}
            }
            //making the chart interactable
            .chartAngleSelection(value: $selectedCount)
            .onChange(of: selectedCount) { oldValue, newValue in
                if let newValue {
                    selectedSector = findSelectedSector(value: newValue)
                } else {
                    selectedSector = nil
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    donutChart()
}
