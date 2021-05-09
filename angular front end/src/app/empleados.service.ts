import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { AppComponent } from './app.component';



@Injectable({
  providedIn: 'root'
})
export class EmpleadosService {
  private baseURL ="http://localhost:8081/usuario";

  constructor(private http:HttpClient) { }

  getData(){
         let url="http://localhost:8081/usuario";
         return this.http.get(url);
  }

  crearEmpleado() {
       

  }

  eliminarEmpleado(){
    
  }
  
}
