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
        return 5 * temperatureGiven - 400
    }
    
    var feedback: String {
        switch atmosphericPressure {
            case ..<100:
                return "The water is boiling above sea level"
            case 100:
                return "The water is boiling at sea level"
            case 100...:
                return "The water is boiling below sea level"
            default:
                return "The water is boiling at sea level"
        }
    }
    
    var body: some View {
        VStack {
            // Celsius
            HStack {
                Text("Boiling Temperature ℃")
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
            
            Text(feedback)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
