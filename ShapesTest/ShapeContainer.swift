//
//  ShapeContainer.swift
//  ShapesTest
//
//  Created by Marc Vandehey on 8/20/17.
//  Copyright © 2017 SkyVan Labs. All rights reserved.
//

import UIKit

class ShapeContainer: UIView {
  private var padding: CGFloat = 0
  private var shapeLayer = CAShapeLayer()
  private var trianglePath = UIBezierPath()
  private var squarePath = UIBezierPath()
  private var hexagonPath = UIBezierPath()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setup()
  }

  func showTriangle() {
    shapeLayer.path = trianglePath.cgPath
  }

  func showSquare() {
    shapeLayer.path = squarePath.cgPath
  }

  func showHexagon() {
    shapeLayer.path = hexagonPath.cgPath
  }

  private func setup() {
    padding = frame.size.width * 0.1

    setupTrianglePath()
    setupSquarePath()
    setupHexagonPath()

    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.black.cgColor
    shapeLayer.lineWidth = 15

    shapeLayer.lineJoin = kCALineJoinRound

    layer.addSublayer(shapeLayer)
  }

  private func setupTrianglePath() {
    trianglePath.move(to: CGPoint(x: frame.size.width / 2, y: padding))
    trianglePath.addLine(to: CGPoint(x: frame.size.width - padding, y: frame.size.height - padding))
    trianglePath.addLine(to: CGPoint(x: padding, y: frame.size.height - padding))

    trianglePath.close()
  }

  private func setupSquarePath() {
    squarePath.move(to: CGPoint(x: padding, y: padding))
    squarePath.addLine(to: CGPoint(x: frame.size.width - padding, y: padding))
    squarePath.addLine(to: CGPoint(x: frame.size.width - padding, y: frame.size.height - padding))
    squarePath.addLine(to: CGPoint(x: padding, y: frame.size.height - padding))

    squarePath.close()
  }

  private func setupHexagonPath() {
    let sideLength = frame.size.width - padding * 2
    hexagonPath.move(to: CGPoint(x: padding + sideLength * 0.25, y: padding))
    hexagonPath.addLine(to: CGPoint(x: padding + sideLength * 0.75, y: padding))
    hexagonPath.addLine(to: CGPoint(x: frame.size.width - padding, y: frame.size.height / 2))

    hexagonPath.addLine(to: CGPoint(x: padding + sideLength * 0.75, y: frame.size.height - padding))
    hexagonPath.addLine(to: CGPoint(x: padding + sideLength * 0.25, y: frame.size.height - padding))

    hexagonPath.addLine(to: CGPoint(x: padding, y: frame.size.height / 2))

    hexagonPath.close()
  }
}
