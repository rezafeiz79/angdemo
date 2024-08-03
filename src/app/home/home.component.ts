import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  data: any;

  constructor(private http: HttpClient) {}

  fetchData() {
    this.http.get('https://rezafeiz79.liara.run/storage/list').subscribe(response => {
      this.data = response;
    });
  }
}
