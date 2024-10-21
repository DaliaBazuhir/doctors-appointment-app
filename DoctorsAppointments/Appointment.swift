//
//  Appointment.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 04/04/1446 AH.
//


import Foundation
class Appointment : Identifiable, ObservableObject {
       let id = UUID()
        var appintment_day: String
        var appintment_time: String
       @Published var appintment_availability: Bool
    init(appintment_day: String, appintment_time: String, appintment_availability: Bool) {
        self.appintment_day = appintment_day
        self.appintment_time = appintment_time
        self.appintment_availability = appintment_availability
    }
}
