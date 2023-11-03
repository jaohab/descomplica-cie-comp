import { Pipe } from "@angular/core";

@Pipe({name: 'appUppercase'})
export class CustomUpperCase {
    transform(value: string, ...args: any[]) {
        if (value) {
            return value.toLocaleUpperCase()
        } else {
            return ""
        }
    }
}