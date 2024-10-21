//
//  HealthTip.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 03/04/1446 AH.
//

import Foundation
struct HealthTip: Identifiable{
    let id = UUID()
    let image : String
    let tip_title : String
    let tip_category : String
    let tip_hashtag : String
    let tip_paragraph : String
    let wrritenBy: String
    let Image_Docotr: String
    init(image: String, tip_title: String, tip_category: String, tip_hashtag: String, tip_paragraph: String, wrritenBy: String, Image_Docotr: String) {
        self.image = image
        self.tip_title = tip_title
        self.tip_category = tip_category
        self.tip_hashtag = tip_hashtag
        self.tip_paragraph = tip_paragraph
        self.wrritenBy = wrritenBy
        self.Image_Docotr = Image_Docotr
    }
}

class HealthTipViewModel {
    @Published  var healthTips = [
        HealthTip(image: "hospital1", tip_title: "What if My Lung Cancer Comes Back?", tip_category: "Stay fit and healthy", tip_hashtag: "#Lung Cancer", tip_paragraph: "Some people start having symptoms of recurrence before their next surveillance scan", wrritenBy: "Dr. Jerome Bell", Image_Docotr: "1"),
        HealthTip(image: "hospital2", tip_title: "10 of the Best Peer-Support Resources", tip_category: "Body", tip_hashtag: "#Cancer", tip_paragraph: "Eat a balanced diet, exercise regularly, and get enough sleep.", wrritenBy: "Dr. Eleanor Pena", Image_Docotr: "3"),
        HealthTip(image: "hospital1", tip_title: "What if My Lung Cancer Comes Back?", tip_category: "Stay fit and healthy", tip_hashtag: "#Lung Cancer", tip_paragraph: "Some people start having symptoms of recurrence before their next surveillance scan", wrritenBy: "Dr. Jody", Image_Docotr: "2"),
        HealthTip(image: "hospital1", tip_title: "Acai Berries 101: A Complete Guide", tip_category: "Symptom Checker", tip_hashtag: "#Diet & Nutrition", tip_paragraph: "In the last several years, you may have noticed the prevalence of acai berries and acai berry", wrritenBy: "Dr. Devon Lanel", Image_Docotr: "1"),
     ]
}
