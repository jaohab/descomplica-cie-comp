import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError, of, tap } from 'rxjs';
import { User } from '../model/user/user.module';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getUsers(): Observable<User[]> {
    var url: string = 'http://localhost:4200/users';
    return this.http.get<User[]>(url).pipe(
      tap((retorno: User[]) => {
        console.log('Listando usuários service')
      }
      ),
      catchError(this.handleError<User[]>('erro ao listar eventos'))
    )
  }

  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error); //log to console instead
      this.log(`${operation} failed: ${error.message}`);
      return of(result as T);
    }
  }

  private log(message: string) {
    console.log(`EventoService: ${message}`);
  }
}
