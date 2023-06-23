//
//  FeedbackAlertViewController.swift
//  valedagavea
//
//  Created by caiomadeira on 20/06/23.
//

import UIKit

final class AlertViewController: UIViewController {
    private let controllerType: ViewControllerType
    
    var alertTitle: String?
    var message: String?
    
    lazy var alertView: UIView = {
        let view = UIView()
        return view
    }()
    
    init(controllerType: ViewControllerType, title: String, message: String) {
        self.controllerType = controllerType
        self.alertTitle = title
        self.message = message
        super.init(nibName: nil, bundle: nil)
        alertView = AlertView(title: title, message: message, style: controllerType)
        view = alertView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
