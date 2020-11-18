//
//  ViewController.swift
//  MixInterface
//
//  Created by Alessio Roberto on 18/11/2020.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    private lazy var viewModel: ViewModel = ViewModel()
    private lazy var specialView = makerSpecialView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add our SwiftUI view controller as a child:
        addSwiftUI(customView: specialView)

        // Apply a series of Auto Layout constraints to its view:
        NSLayoutConstraint.activate([
            specialView.view.topAnchor.constraint(equalTo: view.topAnchor),
            specialView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            specialView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            specialView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    private func makerSpecialView() -> UIHostingController<FormView> {
        let formView = FormView(viewModel: viewModel, keyboardHandler: KeyboardFollower())
        let formVC = UIHostingController(rootView: formView)
        formVC.view.translatesAutoresizingMaskIntoConstraints = false
        return formVC
    }

}

extension UIViewController {
    func addSwiftUI<T>(customView: UIHostingController<T>) {
        addChild(customView)
        view.addSubview(customView.view)
        customView.didMove(toParent: self)
    }

}
