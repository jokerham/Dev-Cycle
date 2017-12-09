//
//  ViewController.swift
//  DevCycle
//
//  Created by 함동균 on 2017. 12. 9..
//  Copyright © 2017년 Nanitelink. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let minimumPanelWidth: CGFloat = 200
    @IBOutlet weak var leftView: NSView!
    @IBOutlet weak var contentView: NSView!
    @IBOutlet weak var rightView: NSView!
    var leftPanelWidth: CGFloat = 0
    var rightPanelWidth: CGFloat = 0
    
    @IBOutlet weak var horizontalSplitView: NSSplitView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horizontalSplitView.delegate = self
        leftPanelWidth = minimumPanelWidth
        rightPanelWidth = minimumPanelWidth
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func panelOption(id: NSSegmentedControl) {
        leftPanelWidth = id.isSelected(forSegment: 0) ? minimumPanelWidth : 0
        rightPanelWidth = id.isSelected(forSegment: 2) ? minimumPanelWidth : 0
    }
}

extension ViewController: NSSplitViewDelegate {
//    func splitViewDidResizeSubviews(_ notification: Notification) {
//        horizontalSplitView.setPosition(leftPanelWidth, ofDividerAt: 0)
//        horizontalSplitView.setPosition(view.frame.width - rightPanelWidth, ofDividerAt: 1)
//    }
    func splitView(_ splitView: NSSplitView, resizeSubviewsWithOldSize oldSize: NSSize) {
        splitViewSetPosition()
    }
    
    func splitViewSetPosition() {
        horizontalSplitView.setPosition(leftPanelWidth, ofDividerAt: 0)
        horizontalSplitView.setPosition(view.frame.width - rightPanelWidth, ofDividerAt: 1)
    }
}
