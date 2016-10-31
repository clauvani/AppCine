//
//  Horario+CoreDataProperties.swift
//  AppCine
//
//  Created by B303-24 on 31/10/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import Foundation
import CoreData


extension Horario
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Horario>
    {
        return NSFetchRequest<Horario>(entityName: "Horario");
    }

    @NSManaged public var horario_horario: String?
    @NSManaged public var pelicula: Pelicula?
    @NSManaged public var sucursal: Sucursal?

}
