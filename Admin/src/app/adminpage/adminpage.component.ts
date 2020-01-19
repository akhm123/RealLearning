import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
var adlog:any=0;
@Component({
  selector: 'app-adminpage',
  templateUrl: './adminpage.component.html',
  styleUrls: ['./adminpage.component.css']
})
export class AdminpageComponent implements OnInit {
  
  constructor(private router:Router) { }

  ngOnInit() {
  }

  adminlogin(user)
  {
    console.log("Admin login"+user.name)
    if(user.name =="harsh1868" && user.password=="harsh1868")
      {
        localStorage.setItem("admin",user.name);
        this.router.navigate(['/adminhome']);
     //  this.lg.adminp();
      }
  
  }
}

