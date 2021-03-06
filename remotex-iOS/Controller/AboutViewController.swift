//
//  AboutViewController.swift
//  remotex-iOS
//
//  Created by archimboldi on 12/05/2017.
//  Copyright © 2017 me.archimboldi. All rights reserved.
//

import AsyncDisplayKit

class AboutViewController: ASViewController<ASDisplayNode> {
    
    var aboutNode: AboutNode
    
    init() {
        self.aboutNode = AboutNode.init(aboutModel: AboutModel.init())
        super.init(node: ASDisplayNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        
        self.node.backgroundColor = Constants.TableLayout.BackgroundColor
        
        self.node.addSubnode(aboutNode)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        aboutNode.frame = CGRect.init(x: 0, y: (self.navigationController?.navigationBar.frame.origin.y)! + (self.navigationController?.navigationBar.frame.size.height)!, width: self.node.frame.size.width, height: self.node.frame.size.height - ((self.navigationController?.navigationBar.frame.origin.y)! + (self.navigationController?.navigationBar.frame.size.height)!))
        aboutNode.setNeedsLayout()
    }
    
    func setupNavigation() {
        self.navigationItem.title = "关于我们"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "backDown"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(backAction))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(shareAction))
    }
    
    func backAction() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func shareAction() {
        let shareText = Constants.ShareContext.TitleText
        let url = Constants.ShareContext.AppStoreLinkURL
        let image = Constants.ShareContext.LogoImage
        var shareObject = [Any]()
        shareObject = [image, url, shareText] as [Any]
        let activityViewController = UIActivityViewController(activityItems: shareObject, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        self.present(activityViewController, animated: true, completion: nil)
    }
}
