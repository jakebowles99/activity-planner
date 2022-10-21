import { NgModule } from '@angular/core'
import { RouterModule } from '@angular/router'
import { CommonModule } from '@angular/common'

import { NavigationLinks } from './navigation-links/navigation-links.component'
import { Copyright } from './copyright/copyright.component'
import { GridCard } from './grid-card/grid-card.component'
import { Slide } from './slide/slide.component'
import { Navbar } from './navbar/navbar.component'
import { Footer } from './footer/footer.component'
import { FeatureCard } from './feature-card/feature-card.component'

@NgModule({
  declarations: [
    NavigationLinks,
    Copyright,
    GridCard,
    Slide,
    Navbar,
    Footer,
    FeatureCard,
  ],
  imports: [CommonModule, RouterModule],
  exports: [
    NavigationLinks,
    Copyright,
    GridCard,
    Slide,
    Navbar,
    Footer,
    FeatureCard,
  ],
})
export class ComponentsModule {}
