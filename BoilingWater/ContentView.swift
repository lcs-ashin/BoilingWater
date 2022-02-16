//
//  ContentView.swift
//  BoilingWater
//
//  Created by Eunbi Shin on 2022-02-16.
//

import SwiftUI

struct ContentView: View {
    // MARK: Stored Properties
    @State var temperatureGiven = 0.0
    
    // MARK: Computed Properties
    var atmosphericPressure: Double {
        return 5 * temperatureGiven - 100
    }
    
    var body: some View {
        VStack {
            // Celsius
            HStack {
                Text("Celsius ℃")
                    .font(.title2.bold())
                
                Spacer()
            }
            Slider(value: $temperatureGiven,
                   in: 80.0...200.0,
                   step: 0.1,
                   label: {
                Text("Celsius")
            },
                   minimumValueLabel: {
                Text("80")
            },
                   maximumValueLabel: {
                Text("200")
            })
            
                .padding()
            Divider()
            
            // Pressure
            HStack {
                Text("Atmospheric Pressure")
                    .font(.title2.bold())
                
                Spacer()
            }
            
            Text("\(String(format: "%.1f", atmosphericPressure)) kPa")
                .font(.largeTitle.bold())
                .padding()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
