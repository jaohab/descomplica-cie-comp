import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AppCalendarEventsComponent } from './app-calendar-events/app-calendar-events.component';
import { AppUserSelectorComponent } from './app-user-selector/app-user-selector.component';

@NgModule({
  declarations: [
    AppComponent,
    AppCalendarEventsComponent,
    AppUserSelectorComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
