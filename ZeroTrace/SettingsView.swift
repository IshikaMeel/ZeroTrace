//
//  SettingsView.swift
//  ZeroTrace
//
//  Created by Ishika Meel on 10/14/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var vehicleType: String = "Sedan"

    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()

            Picker("Select Vehicle Type", selection: $vehicleType) {
                Text("Sedan").tag("Sedan")
                Text("SUV").tag("SUV")
                Text("Truck").tag("Truck")
                // Add more vehicle types as needed
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            Button(action: {
                // Save settings logic here
                print("Settings saved: \(vehicleType)")
            }) {
                Text("Save Settings")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle("Settings", displayMode: .inline)
    }
}


#Preview {
    SettingsView()
}
