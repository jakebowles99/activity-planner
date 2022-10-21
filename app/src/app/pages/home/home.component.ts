import { Component } from '@angular/core'
import { Title, Meta } from '@angular/platform-browser'

@Component({
  selector: 'app-home',
  templateUrl: 'home.component.html',
  styleUrls: ['home.component.css'],
})
export class Home {
  raw79om: string = ' '
  raw5n6b: string = ' '
  rawce52: string = ' '
  rawkwce: string = ' '
  rawj7jy: string = ' '
  rawp3jv: string = ' '

  constructor(private title: Title, private meta: Meta) {
    this.title.setTitle('Feedbox mobile app')
    this.meta.addTags([
      {
        property: 'og:title',
        content: 'Feedbox mobile app',
      },
    ])
  }
}
