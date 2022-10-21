import { Component, Input } from '@angular/core'

@Component({
  selector: 'app-navbar',
  templateUrl: 'navbar.component.html',
  styleUrls: ['navbar.component.css'],
})
export class Navbar {
  @Input()
  image_src: string = '/playground_assets/logo-1500h.png'
  @Input()
  image_src1: string = '/playground_assets/logo-1500h.png'
  @Input()
  image_alt: string = 'logo'
  @Input()
  image_alt1: string = 'image'
  @Input()
  text: string = 'Follow us'
  @Input()
  PrimaryBtn: string = 'Get started'
  @Input()
  PrimaryBtn1: string = 'Get started'

  constructor() {}
}
