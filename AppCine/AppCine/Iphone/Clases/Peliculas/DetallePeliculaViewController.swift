//
//  DetallePeliculaViewController.swift
//  AppCine
//
//  Created by B303-24 on 10/11/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import UIKit

class DetallePeliculaViewController: UIViewController {
    @IBOutlet weak var imgPelicula: UIImageView!
    @IBOutlet weak var lblNombrePelicula: UILabel!
    @IBOutlet weak var lblDirectorPelicula: UILabel!
    @IBOutlet weak var lblRepartoPelicula: UILabel!
    @IBOutlet weak var lblResumenPelicula: UILabel!
    
    
    var objPelicula : Pelicula!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.lblNombrePelicula.text = self.objPelicula.pelicula_nombre!
        self.lblDirectorPelicula.text = self.objPelicula.pelicula_director!
        self.lblRepartoPelicula.text = self.objPelicula.pelicula_reparto!
        self.lblResumenPelicula.text = self.objPelicula.pelicula_resumen!
        
        CDMImageDownloaded.descargarImagen(enURL: self.objPelicula?.pelicula_urlImagen, paraImageView: self.imgPelicula, conPlaceHolder: nil) { (esCorrecto, nombreImagen, imagen) in
            
            self.imgPelicula.image = imagen
        }
        
    }

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
