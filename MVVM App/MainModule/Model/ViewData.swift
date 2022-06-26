//
//  ViewData.swift
//  MVVM App
//
//  Created by Данил on 26.06.2022.
//

enum ViewData {
    case initial
    case loading(UserDate)
    case success(UserDate)
    case failure(UserDate)
    
    struct UserDate {
        let icon: String?
        let title: String?
        let description: String?
        let phoneNumber: String?
    }
}
