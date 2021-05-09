import { Component, OnInit } from '@angular/core';
import { EmpleadosService } from 'src/app/empleados.service';
@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.css']
})
export class ListarComponent implements OnInit {

  constructor(private empleadoServicio: EmpleadosService ) { }

  ngOnInit(): void {
  }

}
