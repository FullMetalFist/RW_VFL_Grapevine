/// Copyright (c) 2017 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class ViewController: UIViewController {
  
  private enum Metrics {
    static let padding: CGFloat = 15.0
    static let iconImageViewWidth: CGFloat = 30.0
  }
  
  @IBOutlet private weak var iconImageView: UIImageView!
  @IBOutlet private weak var appNameLabel: UILabel!
  @IBOutlet private weak var skipButton: UIButton!
  @IBOutlet private weak var appImageView: UIImageView!
  @IBOutlet private weak var welcomeLabel: UILabel!
  @IBOutlet private weak var summaryLabel: UILabel!
  @IBOutlet private weak var pageControl: UIPageControl!
  
  private var allConstraints: [NSLayoutConstraint] = []
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
////    appImageView.isHidden = true
////    welcomeLabel.isHidden = true
////    summaryLabel.isHidden = true
////    pageControl.isHidden = true
//
//    let views: [String: Any] = [
//      "iconImageView": iconImageView,
//      "appNameLabel": appNameLabel,
//      "skipButton": skipButton,
//      "appImageView": appImageView,
//      "welcomeLabel": welcomeLabel,
//      "summaryLabel": summaryLabel,
//      "pageControl": pageControl]
//
//    let metrics = ["horizontalPadding": Metrics.padding, "iconImageViewWidth": Metrics.iconImageViewWidth]
//
//    var allConstraints: [NSLayoutConstraint] = []
//    let options = NSLayoutFormatOptions(rawValue: 0)
//    let iconVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-23-[iconImageView(30)]", options: options, metrics: nil, views: views)
//    allConstraints.append(contentsOf: iconVerticalConstraints)
//    //let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-23-[appNameLabel]", options: options, metrics: nil, views: views)
//    //allConstraints.append(contentsOf: nameLabelVerticalConstraints)
//    //let skipButtonVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[skipButton]", options: options, metrics: nil, views: views)
//    //allConstraints.append(contentsOf: skipButtonVerticalConstraints)
//
//
//    let topRowHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-horizontalPadding-[iconImageView(iconImageViewWidth)]-[appNameLabel]-[skipButton]-horizontalPadding-|", options: [.alignAllCenterY], metrics: metrics, views: views)
//    allConstraints.append(contentsOf: topRowHorizontalConstraints)
//
//    let summaryHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-horizontalPadding-[summaryLabel]-horizontalPadding-|", options: options, metrics: metrics, views: views)
//    allConstraints.append(contentsOf: summaryHorizontalConstraints)
//    //let welcomeHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[welcomeLabel]-15-|", options: options, metrics: nil, views: views)
//    //allConstraints.append(contentsOf: welcomeHorizontalConstraints)
//
//
//    let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[iconImageView]-10-[appImageView]", options: options, metrics: nil, views: views)
//    allConstraints.append(contentsOf: iconToImageVerticalConstraints)
//    let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[appImageView]-10-[welcomeLabel]", options: [.alignAllCenterX], metrics: nil, views: views)
//    allConstraints.append(contentsOf: imageToWelcomeVerticalConstraints)
//    let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
//    allConstraints.append(contentsOf: summaryLabelVerticalConstraints)
//    let summaryToPageVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[summaryLabel]-horizontalPadding-[pageControl(9)]-horizontalPadding-|", options: [.alignAllCenterX], metrics: metrics, views: views)
//    allConstraints.append(contentsOf: summaryToPageVerticalConstraints)
//
//
//    NSLayoutConstraint.activate(allConstraints)
//  }
  
  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    
    if !allConstraints.isEmpty {
      NSLayoutConstraint.deactivate(allConstraints)
      allConstraints.removeAll()
    }
    
    let newInsets = view.safeAreaInsets
    let leftMargin = newInsets.left > 0 ? newInsets.left : Metrics.padding
    let rightMargin = newInsets.right > 0 ? newInsets.right : Metrics.padding
    let topMargin = newInsets.top > 0 ? newInsets.top : Metrics.padding
    let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : Metrics.padding
    
    let metrics = [
      "horizontalPadding": Metrics.padding,
      "iconImageViewWidth": Metrics.iconImageViewWidth,
      "topMargin": topMargin,
      "bottomMargin": bottomMargin,
      "leftMargin": leftMargin,
      "rightMargin": rightMargin
    ]
    
    let views: [String: Any] = [
      "iconImageView":iconImageView,
      "appNameLabel":appNameLabel,
      "skipButton":skipButton,
      "appImageView":appImageView,
      "welcomeLabel":welcomeLabel,
      "summaryLabel":summaryLabel,
      "pageControl":pageControl
    ]
    
    let options = NSLayoutFormatOptions(rawValue: 0)
    
    let iconVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-topMargin-[iconImageView(iconImageViewWidth)]", options: options, metrics: metrics, views: views)
    allConstraints += iconVerticalConstraints
    
    let topRowHorizontalFormat = "H:|-leftMargin-[iconImageView(iconImageViewWidth)]-[appNameLabel]-[skipButton]-rightMargin-|"
    let topRowHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: topRowHorizontalFormat, options: [.alignAllCenterY], metrics: metrics, views: views)
    allConstraints += topRowHorizontalConstraints
    
    let summaryHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-horizontalPadding-[summaryLabel]-horizontalPadding-|", options: options, metrics: metrics, views: views)
    allConstraints += summaryHorizontalConstraints
    
    let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[iconImageView]-10-[appImageView]", options: options, metrics: nil, views: views)
    allConstraints += iconToImageVerticalConstraints
    
    let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[appImageView]-10-[welcomeLabel]", options: [.alignAllCenterX], metrics: metrics, views: views)
    allConstraints += imageToWelcomeVerticalConstraints
    
    let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
    allConstraints += summaryLabelVerticalConstraints
    
    let summaryPageToVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[summaryLabel]-15-[pageControl(9)]-bottomMargin-|", options: [.alignAllCenterX], metrics: metrics, views: views)
    allConstraints += summaryPageToVerticalConstraints
    
    NSLayoutConstraint.activate(allConstraints)
  }
  
}
