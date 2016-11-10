//
//  PeliculasViewController2.swift
//  AppCine
//
//  Created by B303-24 on 10/11/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import UIKit

class PeliculasViewController2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var colPeliculas: UICollectionView!
    
    var arrayPeliculas2 = NSMutableArray()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayPeliculas2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "PeliculaCollectionViewCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PeliculaCollectionViewCell
        
        cell.objPelicula = self.arrayPeliculas2[indexPath.row] as? Pelicula
        cell.actualizarData()
        
        return cell
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        PeliculaBC.listarPeliculas{ (arrayPeliculas2) in
            self.arrayPeliculas2 = arrayPeliculas2
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    override func didReceiveMemoryWarning()
    {
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
