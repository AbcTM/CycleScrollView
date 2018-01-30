//
//  V1CycleScrollViewController.swift
//  CycleScrollView
//
//  Created by feng on 2017/11/29.
//  Copyright © 2017年 tianlinchun. All rights reserved.
//

import UIKit

class V1CycleScrollViewController: UIViewController {

    let urls = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511949367583&di=47bf88b482cc0dbd33461904ca79526e&imgtype=0&src=http%3A%2F%2Fimg.taopic.com%2Fuploads%2Fallimg%2F140305%2F240449-1403050T41292.jpg",
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511949367583&di=a96fb5dfe0554ec7b1b9a017bbaeade9&imgtype=0&src=http%3A%2F%2Fimage.tianjimedia.com%2FuploadImages%2F2015%2F164%2F13%2F27DK0O51G801.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511949367583&di=c8bb8d7a7129bee7d3af899fb6ff01f8&imgtype=0&src=http%3A%2F%2Fwww.pp3.cn%2Fuploads%2F201410%2F2014102406.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511949506162&di=5049c3e446fccd8940332645da016e88&imgtype=0&src=http%3A%2F%2F7xleaj.com1.z0.glb.clouddn.com%2Ffl5189-16051FH125.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511949506162&di=e6449d7bceaedbccde2eefff684ec9a3&imgtype=0&src=http%3A%2F%2Fimgqn.koudaitong.com%2Fupload_files%2F2015%2F02%2F03%2Fecf8f3d3993f786ef012b6035a98feb7.jpg%2521730x0.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511949506160&di=e9232576eb4f182705979196f83ac004&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Dee79a31d22381f308a1485eac168267d%2Fe824b899a9014c081e50b980007b02087bf4f4a8.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1511939476&di=cd67505ead0bf325caae44600b363144&src=http://pic12.nipic.com/20101227/2457331_134529245914_2.jpg"]

    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        print("V1CycleScrollViewController- viewDidLoad")

        let images = ["timg-1","timg-2","timg-3","timg-4","timg-5","timg-6","timg-7"]

        for subView in view.subviews {
            if let view = subView as? CycleScrollViewV1 {
                view.images = images
            }
        }
    }

    deinit {
        print("V1CycleScrollViewController- 销毁")
    }

    // MARK: - didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
