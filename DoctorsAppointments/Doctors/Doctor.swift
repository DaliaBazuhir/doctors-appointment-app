//
//  Doctor.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 30/03/1446 AH.
//

import Foundation

class Doctor : Identifiable,ObservableObject{
    let id = UUID()
    let name: String
    let image : String
    let gender: String
    let speciality: String
    var Exp_year : Int
    var sessionPrice : Double
    @Published var appointments : [Appointment]=[]
    
    var totalRatings : Double
    init(name: String, image: String, gender: String, speciality: String, Exp_year: Int, sessionPrice: Double, appointments: [Appointment], totalRatings: Double) {
        self.name = name
        self.image = image
        self.gender = gender
        self.speciality = speciality
        self.Exp_year = Exp_year
        self.sessionPrice = sessionPrice
        self.appointments = appointments
        self.totalRatings = totalRatings
    }
}


class DoctorViewModel : ObservableObject{
    @Published var docotrs = [
        Doctor(name: "Mark",image: "1", gender: "male", speciality: "Dentest",Exp_year: 4,sessionPrice: 350, appointments: [
            Appointment(appintment_day: "Sat", appintment_time: "10:30 AM", appintment_availability: true),
            Appointment(appintment_day: "Sun", appintment_time: "11:00 AM", appintment_availability: false),
            Appointment(appintment_day: "Sun", appintment_time: "12:00 PM", appintment_availability: true),
            Appointment(appintment_day: "Mon", appintment_time: "01:00 PM", appintment_availability: true),
          ],totalRatings: 3.4),
//        Doctor(name: "Sandy",image: "2", gender: "female", speciality: "Surgery", workingDays: ["Sun","Mon"], workingHoursPerDay: ["2:00 PM","2:30 PM","3:00 PM","3:30 PM","4:00 PM"],totalRatings: 2.7),
        Doctor(name: "Sandy",image: "2", gender: "female", speciality: "Surgery",Exp_year: 6,sessionPrice: 600,appointments: [
            Appointment(appintment_day: "Sun", appintment_time: "9:30 AM", appintment_availability: true),
            Appointment(appintment_day: "Mon", appintment_time: "02:00 PM", appintment_availability: false),
        ],totalRatings: 2.7),
//        Doctor(name: "Jenfier",image: "4", gender: "female", speciality: "Heart", workingDays: ["Tues","Wed"], workingHoursPerDay: ["5:00 PM","5:30 PM","6:00 PM","6:30 PM"],totalRatings: 4.1),
        Doctor(name: "Sarah",image: "4", gender: "female", speciality: "Heart",Exp_year: 8,sessionPrice: 250,appointments: [
            Appointment(appintment_day: "Tues", appintment_time: "5:30 AM", appintment_availability: true),
            Appointment(appintment_day: "Wed", appintment_time: "11:30 PM", appintment_availability: false),
        ],totalRatings: 4.1),
        Doctor(name: "Jhonny",image: "3", gender: "male", speciality: "Children",Exp_year: 5,sessionPrice: 400, appointments: [
            Appointment(appintment_day: "Sun", appintment_time: "5:30 PM", appintment_availability: true),
            Appointment(appintment_day: "Tues", appintment_time: "7:30 PM", appintment_availability: true),
        ],totalRatings: 3.2),
    ]
}
