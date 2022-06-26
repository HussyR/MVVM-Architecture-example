//
//  Testview.swift
//  MVVM App
//
//  Created by Данил on 26.06.2022.
//

import UIKit

class TestView: UIView {
    
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "start"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Здесь реализуется вся логика исходя из состояний
        switch viewData {
        case .initial:
            print("init")
        case .success(let viewData):
            updateView(viewData: viewData)
        case .loading(let viewData):
            updateView(viewData: viewData)
        case .failure(let viewData):
            updateView(viewData: viewData)
        }
        
    }
    
    private func updateView(viewData: ViewData.UserDate?) {
        label.text = viewData?.title
    }
    
}
