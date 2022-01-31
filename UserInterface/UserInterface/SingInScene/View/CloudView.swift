//
//  CloudView.swift
//  UserInterface
//
//  Created by user on 27.01.2022.
//

import UIKit

final class CloudView: UIView {
    private let lineWidth: CGFloat = 3.0
    private let animationDuration: CFTimeInterval = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let scaleX = self.bounds.width / 12
        let scaleY = self.bounds.height / 6
        let path = UIBezierPath()
        path.move(to: CGPoint(x: scaleX * 1, y: self.bounds.height))
        path.addArc(withCenter: CGPoint(x: scaleX * 1, y: scaleY * 5),
                    radius: scaleX,
                    startAngle: CGFloat(Float.pi / 2),
                    endAngle: CGFloat(3 * Float.pi / 2),
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: scaleX * 2, y: scaleY * 4),
                    radius: scaleX,
                    startAngle: CGFloat(Float.pi),
                    endAngle: CGFloat(3 * Float.pi / 2),
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: scaleX * 3.5, y: scaleY * 3),
                    radius: scaleX * 1.5,
                    startAngle: CGFloat(Float.pi),
                    endAngle: CGFloat(7 * Float.pi / 4),
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: scaleX * 6, y: scaleY * 3),
                    radius: scaleX * 2,
                    startAngle: CGFloat(5 * Float.pi / 4),
                    endAngle: CGFloat(7 * Float.pi / 4),
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: scaleX * 8.5, y: scaleY * 3),
                    radius: scaleX * 1.5,
                    startAngle: CGFloat(5 * Float.pi / 4),
                    endAngle: CGFloat(2 * Float.pi),
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: scaleX * 10, y: scaleY * 4),
                    radius: scaleX,
                    startAngle: CGFloat(3 * Float.pi / 2),
                    endAngle: CGFloat(2 * Float.pi),
                    clockwise: true)
        path.addArc(withCenter: CGPoint(x: scaleX * 11, y: scaleY * 5),
                    radius: scaleX,
                    startAngle: CGFloat(3 * Float.pi / 2),
                    endAngle: CGFloat(Float.pi / 2),
                    clockwise: true)
        path.addLine(to: CGPoint(x: scaleX * 11, y: self.bounds.height))
        path.addLine(to: CGPoint(x: scaleX * 1, y: self.bounds.height))
        path.close()
        path.stroke(with: .clear, alpha: 1)
        
        let cloudLayer = CAShapeLayer()
        cloudLayer.path = path.cgPath
        cloudLayer.fillColor = UIColor.clear.cgColor
        cloudLayer.strokeColor = MainPallete.lavender.cgColor
        cloudLayer.lineWidth = self.lineWidth
    
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.duration = self.animationDuration
        pathAnimation.repeatCount = Float.infinity
        cloudLayer.add(pathAnimation, forKey: "strokeEnd")
        self.layer.addSublayer(cloudLayer)
    }
}
