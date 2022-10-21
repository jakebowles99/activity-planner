import { Component, Input } from '@angular/core'

@Component({
  selector: 'app-slide',
  templateUrl: 'slide.component.html',
  styleUrls: ['slide.component.css'],
})
export class Slide {
  @Input()
  Author: string = 'Elisabeth Brooke'
  @Input()
  Testimonial: string =
    '“Love it! I really like the user interface. The sleek aesthetic of the software makes it easy and pleasant to use. I am also a big fan of the way I can customize and organize different feeds and mail sources.”'
  @Input()
  rootClassName: string = ''
  @Input()
  image_src: string =
    'https://images.unsplash.com/photo-1508002366005-75a695ee2d17?ixid=Mnw5MTMyMXwwfDF8c2VhcmNofDUxfHxzbWlsZXxlbnwwfHx8fDE2NDM0MDc4MTE&ixlib=rb-1.2.1&w=700'
  @Input()
  image_alt: string = 'image'
  @Input()
  Role: string = 'Finance Broker'

  constructor() {}
}
