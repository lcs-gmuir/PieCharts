//
//  ContentView.swift
//  PieCharts
//
//  Created by Griffin Muir on 2024-02-07.
//

import SwiftUI
import Charts
struct ContentView: View {
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
                        BarMark(
                            x: .value("Type", coffee.name),
                            y: .value("Cup", coffee.count)
                        )
                        .foregroundStyle(by: .value("Type", coffee.name))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
