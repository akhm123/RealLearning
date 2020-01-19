import { Component, OnInit } from '@angular/core';
import { CountService } from '../service/count.service';
var name:any
@Component({
  selector: 'app-adminhome',
  templateUrl: './adminhome.component.html',
  styleUrls: ['./adminhome.component.css']
})
export class AdminhomeComponent implements OnInit {

  constructor(private count:CountService) { }
  public totaluser:any;
  public totalcourse:any;

  ngOnInit() {
    this.count.getUser().subscribe((data)=>{this.totaluser=data;console.log(this.totaluser)});
    this.count.getCourse().subscribe((data)=>{this.totalcourse=data;console.log(this.totalcourse)});

  }
  name=localStorage.getItem("admin");
}
