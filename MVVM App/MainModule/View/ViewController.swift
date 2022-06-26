//
//  ViewController.swift
//  MVVM App
//
//  Created by Данил on 26.06.2022.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: MainViewModelProtocol!
    private var testView = TestView()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Здесь для примера захардкожено, в идеале сделать DI для нормального тестирования
        viewModel = MainViewModel()
        setupLayout()
        updateView()
    }

    private func setupLayout() {
        testView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testView)
        NSLayoutConstraint.activate([
            testView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            testView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            testView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: testView.bottomAnchor, constant: 40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func updateView() {
        self.viewModel.updateViewData = { [weak self] viewData in
            guard let self = self else { return }
            self.testView.viewData = viewData
            
        }
    }
    
    @objc private func tapped() {
        print("tapped")
        viewModel.startFetch()
    }
    
}

