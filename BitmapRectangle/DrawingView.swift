//
//  DrawingView.swift
//  
//
//  Created by trvslhlt on 5/5/15.
//
//

import UIKit

class DrawingView: UIView {
    
    //properties: every instance of DrawingView will have it's own unique property values
    let rows = 12
    let columns = 14
    var totalWidth: CGFloat { return bounds.width }
    var totalHeight: CGFloat { return bounds.height }
    var columnWidth: CGFloat { return totalWidth / CGFloat(columns) }
    var rowHeight: CGFloat { return totalHeight / CGFloat(rows) }
    var rectangleSize: CGSize { return CGSize(width: columnWidth, height: rowHeight) }
    var context: CGContextRef?
    var draw: (() -> ())?
    
    override func drawRect(rect: CGRect) {
        getReadyToDraw()
        draw?()
    }
    
    func drawRectangleInRowAndColumn(row: Int, _ column: Int) {
//        let fillColor = UIColor(red: CGFloat(column) / CGFloat(columns),
//            green: CGFloat(row) / CGFloat(rows), blue: 1, alpha: 1)
    
        let blueIncrement = (1-0.3)/CGFloat(rows)
        let redIncrement = (0.0-0.7)/CGFloat(columns)
        
//        let fillColor = UIColor(red: 0.7+redIncrement*CGFloat(column), green: 0.0, blue: 0.3+blueIncrement*CGFloat(row), alpha: 1.0)
//        CGContextSetFillColorWithColor(context, fillColor.CGColor)
    
        
        if (row % 2 == 0 && column % 2 == 0) || (row % 2 == 1 && column % 2 == 1) {
            let fillColor = UIColor(red: 0.7+redIncrement*CGFloat(column), green: 0.0, blue: 0.3+blueIncrement*CGFloat(row), alpha: 1.0)
            CGContextSetFillColorWithColor(context, fillColor.CGColor)
        } else {
            let blackColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            CGContextSetFillColorWithColor(context, blackColor.CGColor)
        }
        
        let rectOrigin = CGPoint(x: CGFloat(column) * columnWidth, y: CGFloat(row) * rowHeight)
        drawRectangleFromPoint(rectOrigin)
    }
    
    private func getReadyToDraw() {
        context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 0)
    }
    
    private func drawRectangleFromPoint(point: CGPoint) {
        CGContextAddRect(context, CGRect(origin: point, size: rectangleSize))
        CGContextFillPath(context)
    }


}
