//
//  HospitalCard.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 02/04/1446 AH.
//

import Foundation

class Hospital: Identifiable, ObservableObject{
    let id = UUID()
    let hospital_name: String
    let hospital_field: String
    let hospital_address: String
    let hospital_StartWorkingHour: String
    let hospital_EndWorkingHour: String
    var hospital_km: Double
    let hospital_Image: String
    @Published var isFav : Bool = false

    init(hospital_name: String, hospital_field: String, hospital_address: String, hospital_StartWorkingHour: String, hospital_EndWorkingHour: String, hospital_km: Double, hospital_Image: String) {
        self.hospital_name = hospital_name
        self.hospital_field = hospital_field
        self.hospital_address = hospital_address
        self.hospital_StartWorkingHour = hospital_StartWorkingHour
        self.hospital_EndWorkingHour = hospital_EndWorkingHour
        self.hospital_km = hospital_km
        self.hospital_Image = hospital_Image
    }
}

class HospitalViewModel : ObservableObject{
    @Published  var hospitals: [Hospital] = [
        Hospital(hospital_name: "Phnom Hospital", hospital_field: "Specialist in Surgery", hospital_address: "#C19, Street 281, Khan Russey Keov, Phnom Penh, Cambodia", hospital_StartWorkingHour: "06:00 AM", hospital_EndWorkingHour: "10:00 PM", hospital_km: 2.36, hospital_Image: "hospital2"),
        Hospital(hospital_name: "Kompong Hospital", hospital_field: "General medicine", hospital_address: "#C123, Street 55, Khan Russey Keov, Cambodia", hospital_StartWorkingHour: "06:00 AM", hospital_EndWorkingHour: "10:00 PM", hospital_km: 1.8, hospital_Image: "hospital1"),
        Hospital(hospital_name: "Kandal Hospital", hospital_field: "Specialist in Heart", hospital_address: "#C19, Street 281, Khan Russey Keov, Phnom Penh, Cambodia",  hospital_StartWorkingHour: "06:00 AM", hospital_EndWorkingHour: "10:00 PM", hospital_km: 3.6, hospital_Image: "hospital3"),
        Hospital(hospital_name: "Penh Hospital", hospital_field: "General medicine", hospital_address: "#C123, Street 55, Khan Russey Keov, Cambodia", hospital_StartWorkingHour: "06:00 AM", hospital_EndWorkingHour: "10:00 PM", hospital_km: 5.2, hospital_Image: "hospital4"),
        Hospital(hospital_name: "Abrazo  Hospital", hospital_field: "Specialist in Children", hospital_address: "#C19, Street 281, Khan Russey Keov, Phnom Penh, Cambodia",  hospital_StartWorkingHour: "06:00 AM", hospital_EndWorkingHour: "10:00 PM", hospital_km: 3.6, hospital_Image: "hospital2"),
        Hospital(hospital_name: "Health Hospital", hospital_field: "General medicine", hospital_address: "#C123, Street 55, Khan Russey Keov, Cambodia", hospital_StartWorkingHour: "06:00 AM", hospital_EndWorkingHour: "10:00 PM", hospital_km: 2.9, hospital_Image: "hospital1"),
        
    ]
       @Published var favourites: [Hospital] = []  // Array to hold favorite hospitals
       
       // Update the favourites array when isFav is toggled
       func updateFavourites() {
           favourites = hospitals.filter { $0.isFav }
       }
    

}
