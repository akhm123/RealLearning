import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class CountService {

  constructor(private http:HttpClient,private router:Router) { }

  
  getUser()
  {
   return  this.http.get('http://localhost:7762/usercount')

  }
  getCourse()
  {
   return  this.http.get('http://localhost:7762/coursecount')

  }

}
