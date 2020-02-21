//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Henry Calderon on 2/20/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}

