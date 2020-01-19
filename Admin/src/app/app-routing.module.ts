import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminpageComponent } from './adminpage/adminpage.component';
import { FormsModule, ReactiveFormsModule }   from '@angular/forms';
import { CourseComponent } from './course/course.component';
import { AdminhomeComponent } from './adminhome/adminhome.component';

const routes: Routes = [
  {path:'login',component:AdminpageComponent},
  {path:'course',component:CourseComponent},
  {path:'adminhome',component:AdminhomeComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)
  , FormsModule  ,ReactiveFormsModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
