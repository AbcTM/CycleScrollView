//
//  CycleScrollViewV1.swift
//  CycleScrollView
//
//  Created by feng on 2017/11/29.
//  Copyright © 2017年 tianlinchun. All rights reserved.
//

import UIKit


// 自定义程度不高
class CycleScrollViewV1: UIView {

    var contentScrollView: UIScrollView = UIScrollView.init()


    lazy var leftImgView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()

    lazy var midImgView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()

    lazy var rightImgView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()

    var images = [String]()
    {
        didSet {
            changedImage()
            setUpTimer()
        }
    }

    var currentIndex = 0

    var timer: Timer?

    var autoScroll = true
    var autoScrollTimeInterval: TimeInterval = 2.0



    // MARK: - init
    convenience init(frame: CGRect, images: [String]) {
        self.init(frame: frame)

        self.images = images
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    deinit {
         print("CycleScrollViewV1-销毁")
    }

    // MARK: - Public
    func setUpTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        
        timer = Timer.init(timeInterval: autoScrollTimeInterval, target: self, selector: #selector(scrollScroll), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
    }


    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc func changedImage() {
        guard images.count > 0 else {
            return
        }

        let size = contentScrollView.frame.size
        contentScrollView.setContentOffset(CGPoint.init(x: size.width, y: 0), animated: false)

        let leftIndex = currentIndex - 1 < 0 ? images.count - 1 : currentIndex - 1
        let rightIndex = currentIndex + 1 == images.count ? 0 : currentIndex + 1
        leftImgView.image = UIImage.init(named: images[leftIndex])
        midImgView.image = UIImage.init(named: images[currentIndex])
        rightImgView.image = UIImage.init(named: images[rightIndex])
    }

    @objc func scrollScroll() {
        let size = contentScrollView.frame.size
        contentScrollView.setContentOffset(CGPoint.init(x: 2*size.width, y: 0), animated: true)
//        changedImage()
    }

    // MARK: - UI
    override func layoutSubviews() {
        super.layoutSubviews()

        contentScrollView.frame = self.bounds
        let size = frame.size
        contentScrollView.contentSize = CGSize.init(width: size.width * 3, height: size.height)
        leftImgView.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        midImgView.frame = CGRect.init(x: size.width, y: 0, width: size.width, height: size.height)
        rightImgView.frame = CGRect.init(x: 2*size.width, y: 0, width: size.width, height: size.height)
        let offsetPoint = CGPoint.init(x: size.width, y: 0)
        contentScrollView.setContentOffset(offsetPoint, animated: false)
    }

    //从父视图上移除
    override func removeFromSuperview() {
        super.removeFromSuperview()

        invalidateTimer()
    }

    func setupView() {

        print("CycleScrollViewV1-初始化完成")

        contentScrollView.delegate = self
        contentScrollView.isPagingEnabled = true
        addSubview(contentScrollView)

        leftImgView.contentMode = .scaleAspectFit
        midImgView.contentMode = .scaleAspectFit
        rightImgView.contentMode = .scaleAspectFit

        contentScrollView.addSubview(leftImgView)
        contentScrollView.addSubview(midImgView)
        contentScrollView.addSubview(rightImgView)

        contentScrollView.showsHorizontalScrollIndicator = false
    }
}

extension CycleScrollViewV1: UIScrollViewDelegate {


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let width = scrollView.frame.size.width
        if offset.x == 2*width {
            currentIndex += 1
            currentIndex = currentIndex == images.count ? 0 : currentIndex
            changedImage()
        }else if (offset.x == 0){
            currentIndex -= 1
            currentIndex = currentIndex == -1 ? images.count-1 : currentIndex

            changedImage()
        }
    }

    //开始拽
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if autoScroll {
            invalidateTimer()
        }
    }

    //松开手
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if autoScroll {
            setUpTimer()
        }
    }
}
