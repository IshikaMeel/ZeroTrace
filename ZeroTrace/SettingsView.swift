//
//  SettingsView.swift
//  ZeroTrace
//
//  Created by Noga Gercsak on 10/14/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var vehicleType: String = "Sedan"
    @State private var drivingHours: Int = 0
    @State private var drivingMinutes: Int = 0
    @State private var drivingDate = Date() // Add state for date
    @State private var drivingLogs: [DrivingLog] = []
    @State private var showConfirmation = false

    var body: some View {
        ScrollView { // Wrap the entire content in a ScrollView
            VStack(spacing: 30) {
                // Header
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .padding(.horizontal)
                
                // Vehicle Type Picker
                VStack(alignment: .leading, spacing: 10) {
                    Text("Vehicle Type")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Picker("Select Vehicle Type", selection: $vehicleType) {
                        Text("Sedan").tag("Sedan")
                        Text("SUV").tag("SUV")
                        Text("Truck").tag("Truck")
                        // Add more vehicle types as needed
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal)
                
                // Driving Time Logging
                VStack(alignment: .leading, spacing: 10) {
                    Text("Log Driving Time")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 20) {
                        VStack {
                            Text("Hours")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Picker("Hours", selection: $drivingHours) {
                                ForEach(0..<25) { hour in
                                    Text("\(hour) hr").tag(hour)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 80, height: 100)
                            .clipped()
                        }
                        
                        VStack {
                            Text("Minutes")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Picker("Minutes", selection: $drivingMinutes) {
                                ForEach(0..<60) { minute in
                                    Text("\(minute) min").tag(minute)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 80, height: 100)
                            .clipped()
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal)
                
                // Date Picker for Logging Date
                VStack(alignment: .leading, spacing: 10) {
                    Text("Select Date and Time")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    DatePicker("", selection: $drivingDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal)
                
                // Save Button
                Button(action: {
                    // Save settings logic and log driving time
                    let newLog = DrivingLog(
                        vehicleType: vehicleType,
                        drivingHours: drivingHours,
                        drivingMinutes: drivingMinutes,
                        drivingDate: drivingDate
                    )

                    // Save new log
                    drivingLogs.append(newLog)
                    saveLogs() // Persist the updated logs

                    // Prepare data for GPT
                    let gptInput = prepareDataForGPT(logs: drivingLogs)
                    print("Data for GPT: \(gptInput)")

                    showConfirmation = true
                }) {
                    Text("Save Settings")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                }

                .padding(.horizontal)
                .alert(isPresented: $showConfirmation) {
                    Alert(title: Text("Settings Saved"), message: Text("Your preferences have been updated."), dismissButton: .default(Text("OK")))
                }
                
                // Logging History
                VStack(alignment: .leading, spacing: 10) {
                    Text("Logging History")
                        .font(.headline)
                        .foregroundColor(.gray)

                    if drivingLogs.isEmpty {
                        Text("No logs available")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(drivingLogs) { log in
                                    Text(log.formattedLog) // Use formattedLog property
                                        .padding()
                                        .background(Color(.systemGray5))
                                        .cornerRadius(8)
                                        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 3)
                                }
                            }
                        }
                        .frame(height: 200)
                        .padding(.horizontal)
                    }
                }

                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.bottom, 40)
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color(.systemBackground).ignoresSafeArea())
        }
    }
}

#Preview {
    SettingsView()
}
