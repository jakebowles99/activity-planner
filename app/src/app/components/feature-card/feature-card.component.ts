import { Component, Input } from '@angular/core'

@Component({
  selector: 'feature-card',
  templateUrl: 'feature-card.component.html',
  styleUrls: ['feature-card.component.css'],
})
export class FeatureCard {
  @Input()
  text1: string = 'Get started >'
  @Input()
  text: string =
    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'
  @Input()
  heading: string = 'Search for ideas'
  @Input()
  image_alt: string = 'image'
  @Input()
  image_src: string = 'https://play.teleporthq.io/static/svg/default-img.svg'

  constructor() {}
}
