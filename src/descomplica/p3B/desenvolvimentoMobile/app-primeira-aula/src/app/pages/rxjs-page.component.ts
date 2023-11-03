import { Component, OnInit } from "@angular/core";
import { BehaviorSubject, Subscribable, Subscription, filter, interval, map, of, range, tap } from "rxjs";

@Component({
    selector: 'app-rxjs',
    templateUrl: './rxjs-page.component.html'
})
export class RXJSPageComponent implements OnInit {

    items: Array<number> = []
    //observable = of('item 1')
    observable = interval(1000)
    observable2 = range(1, 10)
    
    subscription!: Subscription

    subject = new BehaviorSubject("Valor Inicial")
    ultimoEvento = ""
    contador = 1

    constructor() {

    }
    
    ngOnInit() {
        this.subscription = this.observable
        .pipe(
            map((x: number) => x*2),
            tap(x => console.log(x)),
            filter(x => x < 10)
        )
        .subscribe((item) => {
            this.items.push(item)
        })

        this.observable2.subscribe(item => {
            this.items.push(item)
        })

        this.subject.asObservable().subscribe(item => {
            this.ultimoEvento = item
        })
    }

    unsubscribeFunc() {
        this.subscription.unsubscribe()
    }

    emitirEvento() {
        this.subject.next("Proximo item " + this.contador)
        this.contador++
    }

}