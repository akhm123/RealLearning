
import { AdminpageComponent } from './adminpage/adminpage.component';
import { CourseComponent } from './course/course.component';

import { CommonModule } from '@angular/common';  
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http'; 
import { Component } from '@angular/core';
import { AdminhomeComponent } from './adminhome/adminhome.component';
@NgModule({
  declarations: [
    AppComponent,
    AdminpageComponent,
    CourseComponent,
    AdminhomeComponent,

 
  ],
  imports: [

    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
