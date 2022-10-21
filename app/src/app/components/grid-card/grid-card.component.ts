import { Component, Input } from '@angular/core'

@Component({
  selector: 'grid-card',
  templateUrl: 'grid-card.component.html',
  styleUrls: ['grid-card.component.css'],
})
export class GridCard {
  @Input()
  text1: string =
    'Lorem ipsum dolor sit amet. Velit officia lorem ipsum dolor consequat duis enim velit mollit.​'
  @Input()
  image_src: string = 'https://play.teleporthq.io/static/svg/default-img.svg'
  @Input()
  text: string = 'Challange yourself'
  @Input()
  image_alt: string = 'image'

  constructor() {}
}
