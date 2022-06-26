//
//  MainViewModel.swift
//  MVVM App
//
//  Created by Данил on 26.06.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)?
    
    init() {
        updateViewData?(.initial)
    }
    
    func startFetch() {
        // start loading
        updateViewData?(.loading(
            ViewData.UserDate(
                icon: nil,
                title: nil,
                description: nil,
                phoneNumber: nil)))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.updateViewData?(.success(ViewData.UserDate(
                icon: "success",
                title: "success",
                description: "good",
                phoneNumber: nil)))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.updateViewData?(.failure(ViewData.UserDate(
                icon: "fail",
                title: "fail",
                description: "fail",
                phoneNumber: nil)))
        }
        
    }
    
    
}
