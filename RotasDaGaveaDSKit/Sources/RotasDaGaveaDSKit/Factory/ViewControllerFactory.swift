//
//  ViewControllerFactory.swift
//  valedagavea
//
//  Created by caiomadeira on 19/06/23.
//

import UIKit

// MARK: - Concrete Factory Example which implements abstract factory interface
enum ViewControllerType {
    case normal(NormalFlow)
    case error(Errors)
    case alert(Alert)
}

enum NormalFlow {
    case home
    case launchScreen
    case userOptions
}
    
enum Errors {
    case bluetoothDisabled
    case beaconError
    case locationError
    case generic
}

enum Alert {
    case feedback
    case warning
    case error(Errors)
}

// metodos de factory devem ter o prefixo make
protocol AlertViewControllerFactory {
    func makeFeedbackAlertViewController() -> UIViewController
    func makeErrorAlertViewController() -> UIViewController
    func makeWarningAlertViewController() -> UIViewController
}

//final class GenericAlertViewController: UIViewController {
//    private let controllerType: ViewControllerType
//    private let message: String
//
//    init(controllerType: ViewControllerType, message: String) {
//        self.controllerType = controllerType
//        self.message = message
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

// Implements abstract factory interface
class NewAlertViewControllerFactory: AlertViewControllerFactory {
    func makeErrorAlertViewController() -> UIViewController {
        let title = "Erro"
        let message = "Erro generico aleatorio."
        return AlertViewController(controllerType: .alert(.error(Errors.generic)), title: title, message: message)
    }
    
    func makeWarningAlertViewController() -> UIViewController {
        let title = "Alerta"
        let message = "Voce nao pode realizar essa acao."
        return AlertViewController(controllerType: .alert(.warning), title: title, message: message)
    }
    
    func makeFeedbackAlertViewController() -> UIViewController {
        let title = "De o um feedback"
        let message = "Escolha um feedback para ser dado."
        return AlertViewController(controllerType: .alert(.feedback), title: title, message: message)
    }
}

//// specialized factory without interface
//struct SpecializedAlertViewControllerFactory {
//
//    let title = "teste"
//    let message = "aaaa"
//
//    func makeFeedbackAlertViewController() -> UIViewController {
//        return FeedBackAlertViewController(controllerType: .alert(.feedback), title: title, message: message)
//    }
//}

let factory: AlertViewControllerFactory = NewAlertViewControllerFactory()
let vc = factory.makeFeedbackAlertViewController()

//extension ViewControllerType {
//    func routeToViewController(_ viewControllerType: ViewControllerType) -> UIViewController {
//        switch self {
//        case .normal(.home):
//            return MapViewController()
//
//        case .normal(.launchScreen):
//            return OnBoardingPageViewController()
//
//        }
//    }
//}
