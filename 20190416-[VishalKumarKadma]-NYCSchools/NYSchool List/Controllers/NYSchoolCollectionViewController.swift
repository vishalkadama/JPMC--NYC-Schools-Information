//
//  NYSchoolCollectionViewController.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SchoolCell"

class NYSchoolServiceHelper: NYSchoolServiceHelperProtocol{}
class NYCSchoolDetailsServiceHelper: NYSchoolDetailsServiceHelperProtocol{}

class NYSchoolCollectionViewController: UICollectionViewController {
    
    //ViewModel
    lazy var nySchoolVM:NYSchoolVM = {
        var service  = NYSchoolServiceHelper.init()
        let schoolVm = NYSchoolVM.init(service: service)
        return schoolVm
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "New York Schools"
        setupCollectionView()
        setUpBinding()
        //Intial service call
        nySchoolVM.fetchSchoolList(offset: 20)
    }
    

    // Binding of the data
    func setUpBinding()  {
        
        nySchoolVM.state.bind { (value) in
            guard let value = value else {
                return
            }
            self.removeLoader()
            // -----State is maintained based on the servcie respone so that we can update UI accordingly
            switch value {
            case .isLoaded:
                self.collectionView.reloadData()
                break
            case .isLoading:
                self.showLoader()
                break
            case .isError:
                break
            case .isEmpty:
                break
            }
        }
    }
    
    // Setting up UICollectionView
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.prefetchDataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 35, left: 10, bottom: 35, right: 10)
        
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        self.collectionView.collectionViewLayout = layout
        self.collectionView?.register(UINib(nibName: "SchoolCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //MARK:- Progress view or Loader view to updated the user.
    func showLoader(textdata:String?=nil) {
        let loadingLabel = UILabel.init(frame: CGRect.init(x: 0, y: 60, width: self.view.frame.width, height: 70))
        loadingLabel.textColor = UIColor.black
        loadingLabel.tag = 909
        if textdata?.isEmpty ?? true{
            loadingLabel.text = "Loading.."
        }else{
            loadingLabel.text = textdata
        }
        loadingLabel.backgroundColor = UIColor.red
        self.view.addSubview(loadingLabel)
        loadingLabel.bringSubviewToFront(self.view)
    }
    func removeLoader() {
        DispatchQueue.main.async{
            self.view.viewWithTag(909)?.removeFromSuperview()
        }
    }
    
  
}

// MARK:- UICollectionViewDataSource
extension NYSchoolCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nySchoolVM.schoolListVM.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SchoolCell
        cell.backgroundColor = UIColor.gray
        cell.setDataSource(dataSource: nySchoolVM.schoolListVM[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 40, height: 350)
    }
    
   
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NYCDetailTableView") as? NYCDetailTableView
        vc!.dbn = nySchoolVM.schoolListVM[indexPath.row].dbn ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

// MARK:- UICollectionViewDelegate
extension NYSchoolCollectionViewController : UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        print(indexPaths)
        if nySchoolVM.schoolListVM.count-1 == (indexPaths.last?.row ?? 0) {
            nySchoolVM.fetchSchoolList(offset: indexPaths.last?.row ?? 0)
        }
        
    }

}
