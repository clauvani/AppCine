//
//  PeliculasViewController.swift
//  AppCine
//
//  Created by B303-24 on 31/10/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import UIKit

class PeliculasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tblPeliculas: UITableView!

    var arrayPeliculas = NSMutableArray()
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrayPeliculas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "PeliculaTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PeliculaTableViewCell
        cell.objPelicula = self.arrayPeliculas[indexPath.row] as? Pelicula
        cell.actualizarData()
        
        return cell
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        PeliculaBC.listarPeliculas { (arrayPeliculas) in
            self.arrayPeliculas = arrayPeliculas
//            self.tblPeliculas.reloadData()
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
