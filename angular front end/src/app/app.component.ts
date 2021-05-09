import { Component, ElementRef, ViewChild,OnInit } from '@angular/core';
import { EmpleadosService } from './empleados.service';
import * as jspdf from 'jspdf';
import {FormsModule} from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {

  title = 'empleadodocu';
  onSubmit(data: any){
    this.http.post('http://localhost:8081/usuario',data).subscribe((result)=>{
      console.warn("result",result)
    });
    console.warn(data);
    return data; 

  }
  onEnvio(data: any){
    this.http.delete('http://localhost:8081/usuario',data)
    console.warn(data);
  }
  urllink:string ="assets/fotoempleado/1.jpg"
   selectFile(event: { target: { files: any; }; }){
     if(event.target.files){
           var reader = new FileReader()
           reader.readAsDataURL(event.target.files[0])
           reader.onload = (event:any) => {
             this.urllink = event.target.result
           }
     }
   }
   data: any = [];
   
    constructor( private empleado: EmpleadosService, private http:HttpClient){
      this.empleado.getData().subscribe(data=>{
        console.warn(data)
        this.data=data
      })
    }
  @ViewChild('content') content!: ElementRef;

   download(){
     console.log('Descargando PDF...');
     const doc = new jspdf.jsPDF();
         
     let specialElementsHandler ={
          '#editor': function(element: any, renderer: any){
            return true; 
          }
     };
     
     let content = this.content.nativeElement;
     let wrapper = "<div style='font-size:6px;line-height:1; border:1px transparent; width:10px;margin-top:10px; margin-bottom:100px; margin-right:100px;'> "+content.innerHTML+"</div>";
     doc.html(wrapper,{
      callback: function (doc) {
        doc.save("reporte.pdf");
      }
   });
     //doc.save("reporte.pdf");

   }
    

    }

  