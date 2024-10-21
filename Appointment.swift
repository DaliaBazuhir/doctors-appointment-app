//
//  Appointment.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 03/04/1446 AH.
//

import Foundation

struct Appointment : Identifiable {
       let id = UUID()
        let appintment_day: String
        let appintment_time: String
        var appintment_availability: Bool
}
