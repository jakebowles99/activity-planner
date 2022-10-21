import { Component, Input } from '@angular/core'

@Component({
  selector: 'navigation-links',
  templateUrl: 'navigation-links.component.html',
  styleUrls: ['navigation-links.component.css'],
})
export class NavigationLinks {
  @Input()
  text2: string = 'Features'
  @Input()
  text3: string = 'Blog'
  @Input()
  rootClassName: string = ''
  @Input()
  text4: string = 'Pricing'
  @Input()
  text: string = 'Home'
  @Input()
  text1: string = 'About'

  constructor() {}
}
