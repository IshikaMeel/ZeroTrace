//
//  PredictionView.swift
//  ZeroTrace
//
//  Created by Ishika Meel on 10/14/24.
//

import SwiftUI

struct PredictionView: View {
    @State private var distance: Double = 0.0
    @State private var vehicleType: String = "Sedan"
    @State private var predictedEmissions: Double?

    var body: some View {
        VStack {
            Text("Emissions Prediction")
                .font(.largeTitle)
                .padding()

            TextField("Enter distance (miles)", value: $distance, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Picker("Select Vehicle Type", selection: $vehicleType) {
                Text("Sedan").tag("Sedan")
                Text("SUV").tag("SUV")
                Text("Truck").tag("Truck")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button(action: {
                predictedEmissions = calculateEmissions(distance: distance, vehicleType: vehicleType)
            }) {
                Text("Predict Emissions")
                    .font(.headline)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            if let emissions = predictedEmissions {
                Text("Predicted Emissions: \(emissions, specifier: "%.2f") kg CO2")
                    .font(.title2)
                    .padding()
            }

            Spacer()
        }
        // No need to set navigationBarTitle here since it's set in HomeView
    }

    func calculateEmissions(distance: Double, vehicleType: String) -> Double {
        let emissionsFactor: Double = vehicleType == "SUV" ? 0.25 : vehicleType == "Truck" ? 0.35 : 0.20
        return distance * emissionsFactor
    }
}

#Preview {
    PredictionView()
}


// save button to show history for the user (i.e. firebase)
// add when the user drove 
// from collected data, train model to predict how much the user is projected to emit carbon in a given time
// app tells how much carbon the user is predicted to produce based off the data + tips
