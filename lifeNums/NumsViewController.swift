//
//  NumsViewController.swift
//  lifeNums
//
//  Created by 方仕賢 on 2022/2/18.
//

import UIKit

var button = 0

class NumsViewController: UIViewController {
    
    @IBOutlet weak var givenNumLabel: UILabel!
    
    @IBOutlet weak var lifeNumLabel: UILabel!
    
    @IBOutlet weak var giftNumLabel: UILabel!
    
    @IBOutlet weak var signNumLabel: UILabel!
    
    @IBOutlet weak var birthNumLabel: UILabel!
    
    @IBOutlet weak var vacNumLabel: UILabel!
    
    @IBOutlet var resultButtons: [UIButton]!
    
    
    let side = 100
    let x = 60
    let y = 180
    var numPoints = [CGPoint]()
    var radius = [Int].init(repeating: 100, count: 9)

    override func viewDidLoad() {
        super.viewDidLoad()
        makeColumn()
        makeCircles()
        showNum()
    }
    
    func showNum(){
        signNumLabel.text = "\(signNum)"
        
        birthNumLabel.text = "\(birthNum)"
        
        for i in 0...giftNums.count-1{
            giftNumLabel.text! += "\(giftNums[i]) "
        }
        
        for i in 0...allNums.count-1{
            givenNumLabel.text! += "\(allNums[i]) "
        }
        
        for i in 0...radius.count-1{
            if radius[i] == 100 {
                vacNumLabel.text! += "\(i+1) "
            }
        }
        
        lifeNumLabel.text = "\(lifeNum)"
    }
    
    func makeACircle(x: Int, y: Int, side: Int){
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: CGPoint(x: x, y: y), radius: CGFloat(side/2-10), startAngle: 0, endAngle: 360, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = circlePath.cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 2
        layer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(layer)
    }
    
    func makeCircles(){
        radius = [Int].init(repeating: 100, count: 9)
        print(radius)
        
        for num in 0...allNums.count-1 {
            shrinkCircle(num: allNums[num]-1)
            makeACircle(x: Int(numPoints[allNums[num]-1].x), y: Int(numPoints[allNums[num]-1].y), side: radius[allNums[num]-1])
            
        }
        
        shrinkCircle(num: signNum-1)
        makeACircle(x: Int(numPoints[signNum-1].x), y: Int(numPoints[signNum-1].y), side: radius[signNum-1])
        
        shrinkCircle(num: birthNum-1)
        makeACircle(x: Int(numPoints[birthNum-1].x), y: Int(numPoints[birthNum-1].y), side: radius[birthNum-1])
        
        shrinkCircle(num: lifeNum-1)
        makeACircle(x: Int(numPoints[lifeNum-1].x), y: Int(numPoints[lifeNum-1].y), side: radius[lifeNum-1])
        
        for num in 0...giftNums.count-1{
            shrinkCircle(num: giftNums[num]-1)
            makeACircle(x: Int(numPoints[giftNums[num]-1].x), y: Int(numPoints[giftNums[num]-1].y), side: radius[giftNums[num]-1])
        }
    }
    
    func shrinkCircle(num: Int){
        radius[num] -= 10
    }
    
    
    
    func makeColumn(){
        var num = 0
        for i in 1...3 {
            
            for n in 0...2 {
                let numLabel = UILabel(frame: CGRect(x: side*i, y: 100+side*n, width: 50, height: 50))
                num += 1
                numLabel.text = "\(num)"
                numLabel.font = UIFont.systemFont(ofSize: 30)
                numPoints.append(CGPoint(x: side*i+side/2-40, y: 100+side*n+side/2-25))
                view.addSubview(numLabel)
            }
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x+side*3, y: y))
        path.move(to: CGPoint(x: x, y: y+side))
        path.addLine(to: CGPoint(x: x+side*3, y: y+side))
        path.move(to: CGPoint(x: x+side, y: y-side))
        path.addLine(to: CGPoint(x: x+side, y: y+side*2))
        path.move(to: CGPoint(x: x+side*2, y: y-side))
        path.addLine(to: CGPoint(x: x+side*2, y: y+side*2))
        path.move(to: CGPoint(x: x, y: y-side))
        path.addLine(to: CGPoint(x: x, y: y+side*2))
        path.addLine(to: CGPoint(x: x+side*3, y: y+side*2))
        path.addLine(to: CGPoint(x: x+side*3, y: y-side))
        path.close()
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = 2
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(layer)
    }
    
    @IBAction func checkResult(_ sender: UIButton) {
        button = 0
        while !resultButtons[button].isTouchInside {
            button += 1
        }
        
    }
    

   
}
