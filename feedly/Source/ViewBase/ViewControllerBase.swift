//
//  ViewControllerBase.swift
//  feedly
//
//  Created by kou yamamoto on 2021/08/29.
//

import UIKit
import Toast

// ViewControllerの基底クラス
class ViewControllerBase: UIViewController {

    func showIndicator(isShow: Bool) {
        switch isShow {
        case true:
            self.view.makeToastActivity(.center)
        case false:
            self.view.hideToastActivity()
        }
    }

    func showToast(errorMessage: String) {
        self.view.makeToast(errorMessage, duration: 1.0, position: .bottom)
    }
}
