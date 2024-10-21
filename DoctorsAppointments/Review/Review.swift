//
//  Review.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 02/04/1446 AH.
//

import Foundation

struct Review: Identifiable{
    let id = UUID()
    let userName: String
    let userImage : String
    let doctorName: String
    let review : String
    init(userName: String, userImage: String, doctorName: String, review: String) {
        self.userName = userName
        self.userImage = userImage
        self.doctorName = doctorName
        self.review = review
    }
}
class ReviewViewModel : ObservableObject {
    @Published var reviews = [
    Review(userName: "Jhon King", userImage: "user", doctorName: "Mark", review: "Dr. Mark is very friendly."),
    Review(userName: "Jhon King", userImage: "user", doctorName: "Gorge", review: "Dr Gorge is fantastic! Highly recommended."),
    ]
    func addNewReview(userName: String, doctorName: String,review: String){
        reviews.append(Review(userName: userName, userImage: "user", doctorName: doctorName, review: review))
    }
}
