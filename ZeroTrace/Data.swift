//
//  Data.swift
//  ZeroTrace
//
//  Created by Noga Gercsak on 10/22/24.
//

import Foundation

var drivingLogs: [DrivingLog] = []

struct DrivingLog: Identifiable, Codable {
    var id = UUID() // Unique identifier for each log
    var vehicleType: String
    var drivingHours: Int
    var drivingMinutes: Int
    var drivingDate: Date
    
    // Computed property to get a formatted string
    var formattedLog: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let formattedDate = formatter.string(from: drivingDate)
        return "\(vehicleType) - \(drivingHours) hr \(drivingMinutes) min on \(formattedDate)"
    }
}

func saveLogs() {
    if let encoded = try? JSONEncoder().encode(drivingLogs) {
        UserDefaults.standard.set(encoded, forKey: "drivingLogs")
    }
}

func loadLogs() {
    if let savedLogs = UserDefaults.standard.data(forKey: "drivingLogs") {
        if let decodedLogs = try? JSONDecoder().decode([DrivingLog].self, from: savedLogs) {
            drivingLogs = decodedLogs
        }
    }
}

func prepareDataForGPT(logs: [DrivingLog]) -> String {
    var dataForGPT = "Driving Logs:\n"
    
    for log in logs {
        dataForGPT += "\(log.formattedLog)\n"
    }
    
    return dataForGPT
}

// Example GPT Wrapper for predictions
class GPTWrapper {
    func getPredictions(for input: String, completion: @escaping (String) -> Void) {
        let result = "Predicted output based on: \(input)"
        completion(result)
    }
}

let gptWrapper = GPTWrapper()

func getPredictions() {
    let gptInput = prepareDataForGPT(logs: drivingLogs)
    gptWrapper.getPredictions(for: gptInput) { result in
        print("Prediction Result: \(result)")
    }
}
